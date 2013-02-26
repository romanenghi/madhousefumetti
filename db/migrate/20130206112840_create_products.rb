class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :titolo
      t.string :codice
      t.string :codiceFumettoOnline
      t.string :isbn
      t.string :copertina
      t.integer :prezzo
      t.text :descrizione
      t.integer :editore_id
      t.integer :serie_id
      t.integer :collana_id
      t.boolean :lockUpdate
      t.timestamps
    end
  end
end
