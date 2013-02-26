class CreateBarcodes < ActiveRecord::Migration
  def change
    create_table :barcodes do |t|
      t.integer :product_id
      t.string :code

      t.timestamps
    end
  end
end
