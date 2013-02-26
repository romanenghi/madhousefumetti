require 'spec_helper'

describe Getdata do

  it "importa i dati dalle schede" do
    getData = Getdata.new
    
    #crea una scheda fumetto e lo salva
    scheda = SchedaFumetto.new
    scheda.codice ='c58787000010'
    scheda.titolo ='NEVERLAND 203'
    scheda.collana =['1 SEGRETO X 2','1']
    scheda.prezzo = '3,90'
    scheda.isbn = '977112998600180203'
    scheda.copertina = 'http://www.fumetto-online.it/ew/ew_albi/images/STAR%20COMICS/4222.1.jpg'
    scheda.descrizione = "Prende il via"
    scheda.disegnatori =['MORINAGA Ai']
    scheda.save!
    
    getData.aggiornaAnagrafiche("fumetto online","reparse schede")
    
    
    
  end
end
