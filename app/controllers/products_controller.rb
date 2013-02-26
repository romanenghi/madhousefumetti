class ProductsController < ApplicationController
  active_scaffold :product do |conf|
    conf.columns = [:titolo, :prezzo, :editore, :productcollanas, :copertina, :descrizione, :barcodes, :isbn]
    conf.list.columns = [:titolo, :productcollanas, :editore, :prezzo]
  end
end
