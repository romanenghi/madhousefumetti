
require 'mechanize'

class SchedaFumetto < ActiveRecord::Base
   
  validates :codice, :presence => true
  validates :codice, :uniqueness => true 
  serialize :serie, Array
  serialize :collana, Array
  serialize :disegnatori, Array
  serialize :sceneggiatori, Array
  
  def getScheda(tipo, opt)  
      if tipo == "scheda"
          agent = Mechanize.new
          #estrae la scheda fumetto
          wholePage = agent.get(opt)
          wholePage.encoding = "iso-8859-1"
          page = wholePage.search(".//article[@class='albo']").first 
      end
      if tipo == "da ricerca"
         page = opt
      end

      extractedInfo = page.search(".//div[@class='scheda']/span[@class='info']")
      extractedInfo.each do |t|
         text = t.text[/\w+:/]
         case text
         when "Titolo:"
            self.titolo = t.next.next.child.text
         when "ISBN:"
            self.isbn = t.next.text[/\d+/]
         when "Prezzo:"
            self.prezzo = t.next.text[/\d+,\d+/]
         when "Editore:"
            self.editore = t.next.next.text
         when "Collana:"
            collana = t.next.next.text
            collana_numero = t.next.next.next.text[/\d+/]
            self.collana =  [collana, collana_numero]
         when "Serie:"
            serie = t.next.next.text
            serie_numero = t.next.next.next.text[/\d+/]
            self.serie =  [serie, serie_numero]
         end
      end
      desc = ""
      page.search(".//div[@class='testo']").each do |descrizione_parziale|
         desc << descrizione_parziale.text.strip.gsub(/Tweet.*/,"")
      end
      if desc.strip != ""
           self.descrizione = desc.strip.force_encoding("ISO-8859-1");
      else  
           self.descrizione ='non disponibile'
      end
      
      
      begin
        dis = page.search(".//tr/td[@class='tdv']").first.text
      rescue
        dis = "non disponibile"
      end
      self.disegnatori << dis
      
      #rileva codice
      str = page.search(".//a")[1]['href'][/-.\w*.php$/]
      self.codice = str[1,str.length-5]
      
      #rileva copertina
      copertina = 'http://www.fumetto-online.it' << page.search(".//a/img")[0]['src']
      self.copertina = copertina
        
  end
  
end
