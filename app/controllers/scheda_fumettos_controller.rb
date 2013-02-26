class SchedaFumettosController < ApplicationController
  active_scaffold :scheda_fumetto do |conf|
    conf.columns = [:copertina, :codice, :titolo, :isbn, :editore, :collana, :serie, :prezzo, :descrizione]
    conf.list.columns =[:copertina, :serie, :titolo, :collana, :editore, :prezzo]
    conf.search.live = true
  end
end
