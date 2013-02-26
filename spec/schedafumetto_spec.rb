# encoding:ISO-8859-1

require 'spec_helper'

describe SchedaFumetto do
	it "controllo recupero anagrafica completa - da scheda singola" do
		tmp = SchedaFumetto.new
		tmp.getScheda("scheda","http://www.fumetto-online.it/it/star-comics-segreto-2-neverland-203-c58787000010.php")
		tmp.codice.should == "c58787000010"
		tmp.titolo.should == "NEVERLAND 203"
		tmp.isbn.should == "977112998600180203"
		tmp.prezzo.should == "3,90"
		tmp.editore.should =="STAR COMICS"
		tmp.collana.should == ['1 SEGRETO X 2','1']
		tmp.serie.should == []
		tmp.descrizione[0,13].should == "Prende il via".force_encoding("ISO-8859-1")
		tmp.descrizione[tmp.descrizione.length-11,11].should == "situazioni!".force_encoding("ISO-8859-1")
		tmp.disegnatori.should == ['MORINAGA Ai']
		tmp.copertina.should == 'http://www.fumetto-online.it/images/fumetti/STAR%20COMICS/star-comics-segreto-2-neverland-203-58787000010.jpg'
	end
	
	it  "controllo anagrafica con dati parziali - da scheda singola" do
		tmp = SchedaFumetto.new
		tmp.getScheda("scheda","http://www.fumetto-online.it/it/star-comics-one-piece-one-piece-3-c51244000030.php")
		tmp.titolo.should == "ONE PIECE N. 3"
		tmp.editore.should == "STAR COMICS"
		tmp.collana.should == ['ONE PIECE','3']
		tmp.serie.should ==[]
		tmp.prezzo.should == "3,90"
		tmp.isbn.should == "977112999100510088"
		tmp.disegnatori.should == ['non disponibile']
		tmp.descrizione.should == "non disponibile"
		
		tmp = SchedaFumetto.new
		tmp.getScheda("scheda","http://www.fumetto-online.it/it/star-comics-segreto-2-m8-7-segreto-2-c58787000070.php")
		tmp.titolo.should == "1 SEGRETO X 2"
		tmp.editore.should == "STAR COMICS"
		tmp.collana.should == ['1 SEGRETO X 2 (m8)','7']
		tmp.serie.should == []
		tmp.prezzo.should == "4,30"
		tmp.isbn.should == "9788864203355"
		tmp.disegnatori.should == ['MORINAGA Ai']
		tmp.descrizione[0,14].should == "Formato: 13X18"
		tmp.descrizione[tmp.descrizione.length-9,9].should == "Morinaga!".force_encoding("ISO-8859-1")
	
		tmp = SchedaFumetto.new
		tmp.getScheda("scheda","http://www.fumetto-online.it/it/panini-comics-100-marvel-246-vendetta-c46152002460.php")
		tmp.titolo.should == "VENDETTA"
		tmp.editore.should == "PANINI COMICS"
		tmp.collana.should == ['100% MARVEL','246']
		tmp.serie.should == ['VENDETTA','0']
		tmp.prezzo.should == "13,00"
		tmp.isbn.should == "9788863041811"
		tmp.disegnatori.should == ['DRAGOTTA Nick']
		tmp.sceneggiatori.should == ['CASEY Joe']
		tmp.descrizione[0,14].should == "Formato: 13X18"
		tmp.descrizione[tmp.descrizione.length-9,9].should == "Morinaga!".force_encoding("ISO-8859-1")
		
		tmp = SchedaFumetto.new
		tmp.getScheda("scheda","http://www.fumetto-online.it/it/panini-comics-avx-versus-m3-1-marvel-crossover-78-c68704000010.php")
		tmp.titolo.should == "MARVEL CROSSOVER 78"
	end

end


