class CreateCollanas < ActiveRecord::Migration
  def change
    create_table :collanas do |t|
      t.integer :editore_id
      t.string :nome
      t.string :nomeFumettoOnline
      t.timestamps
    end
  end
end
