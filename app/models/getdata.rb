# encoding:ISO-8859-1

require 'mechanize'

class Getdata < ActiveRecord::Base
  attr_accessible :elenco, :totale_albi
  serialize :eleco, Array
    
    def aggiornaAnagrafiche(tipo, opzioni)
      case tipo
      when "fumetto online"
        aggiornaDaFumettoOnline(opzioni)
      else
        raise 'tipo di aggiornamento non implementato'
      end
    end
    
    def aggiornaDaFumettoOnline(opzioni)
      case opzioni
      when "reparse schede"
        SchedaFumetto.find_each do |scheda|
          #se esiste gia' un fumetto con lo stesso codice, lo carica, in alternativa grea un nuovo oggetto
          albo = Product.where("codiceFumettoOnline = ?",scheda.codice).first
          if albo.nil? 
            albo = Product.new
          end
          #aggiorna l'anagrafica solo se "locked" è Falso
          if albo.lockUpdate == false || albo.lockUpdate.nil?
            albo.codiceFumettoOnline = scheda.codice
            albo.copertina = scheda.copertina
            albo.titolo = scheda.titolo
            #[FIXME] gli isbn diventano barcode
            albo.isbn = scheda.isbn
            albo.prezzo = scheda.prezzo
            albo.descrizione = scheda.descrizione
            
          end
      
          #verifica se l'editore indicato esiste gia', in alternativa lo crea
          editore = Editore.where("nomeFumettoOnline = ?",scheda.editore).first
          if editore.nil?
            editore = Editore.new
            editore.nomeFumettoOnline = scheda.editore
            editore.nome = editore.nomeFumettoOnline
            editore.save!
          end
          #associa fumetto ed editore
          albo.editore = editore
          
          #verifica se la collana esiste gia', in alternativa la crea'
          collana = Collana.where("nomeFumettoOnline  = ?",scheda.collana[0]).first
          if collana.nil?
            collana = Collana.new
            collana.nomeFumettoOnline = scheda.collana[0]
            collana.nome = collana.nomeFumettoOnline
            collana.editore = albo.editore
            collana.save!
          end
          
          if collana.editore.nil?
            collana.editore = albo.editore
            collana.save!
          end
          
          #verifica se il prodotto è gia' associato alla collana, in caso contrario crea l'associazione
          associazione_collana = Productcollana.where("product_id = ?",albo.id).first
          if associazione_collana.nil?
            associazione_collana = Productcollana.new
            associazione_collana.product = albo
            associazione_collana.collana = collana
            associazione_collana.numero = scheda.collana[1]
            associazione_collana.save!
          end
          albo.productcollanas << associazione_collana
          
          #salva
          albo.save!
          
        end
      else
        raise 'tipo di aggiornamento non implementato'
      end
    end
    
    
    def parseUrl(tipo,opzioni, url)
      tipo_di_parse = tipo
      case tipo
        when "all" 
          parseElencoProdotti(url, opzioni) 
        else
          puts 'tipo di parse non implementato'
       end    
    end
    
    def parseElencoProdotti(url, opzioni)
      agent = Mechanize.new
      agent.user_agent_alias = 'Mac Safari'
      wholePage = agent.get(url)
      wholePage.encoding = "iso-8859-1"
      ## fase 1 
      ## verifica quante schede in tutto andranno parsate -> totale_albi
      begin
         self.totale_albi = wholePage.search(".//section[@id='fumetti']/strong").first.text[/\d+/]
      rescue
         self.totale_albi = 'non specificato'
      end
      
      ## fase 2
      ## estrae tutti i link di tutti i prodotti, passando tutte le pagine
      ## e li memorizza in un array
      fumetti = Array.new
      begin
         product_links = wholePage.search(".//article[@class='albo']/a[2]")
         
         if opzioni == "schede"
            wholePage.search("//article[@class='albo']").each do |sezione|
              nuovascheda = SchedaFumetto.new
              vecchiascheda = SchedaFumetto.new
              nuovascheda.getScheda("da ricerca", sezione)
              
              vecchiascheda = SchedaFumetto.where("codice = ?", nuovascheda.codice).first
  
              if vecchiascheda.nil?
                nuovascheda.save
              else
               #TO_DO - gestire l'update' 
              end
              
              
            end
         end
         
         product_links.each {|link| fumetti <<  [link['href'], link.text]}
 
        
         next_page_link = wholePage.links.find { |l| l.text.force_encoding("iso-8859-1") == '»'.force_encoding("iso-8859-1")  }
         if !next_page_link.nil?
           wholePage = next_page_link.click
          end
       end while !next_page_link.nil?      
    end
  
end
