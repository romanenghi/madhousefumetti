class CreateProductcollanas < ActiveRecord::Migration
  def change
    create_table :productcollanas do |t|
      t.string :numero
      t.integer :collana_id
      t.integer :product_id
      t.timestamps
    end
  end
end