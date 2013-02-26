class CreateGetdata < ActiveRecord::Migration
  def change
    create_table :getdata do |t|
      t.text :elenco
      t.integer :prodotti_rilevati
      t.string :totale_albi
      t.timestamps
    end
  end
end
