class CreateSchedaFumettos < ActiveRecord::Migration
  def change
    create_table :scheda_fumettos do |t|
      t.string :codice
      t.string :copertina
      t.string :titolo
      t.string :editore
      t.text :serie
      t.text :collana
      t.string :isbn
      t.string :prezzo
      t.string :descrizione
      t.text :disegnatori
      t.text :sceneggiatori
      t.text :htmlpage
      t.string :urlCopertina
      t.timestamps
    end
  end
end