class CreateEditores < ActiveRecord::Migration
  def change
    create_table :editores do |t|
      t.string :nome
      t.string :nomeFumettoOnline
      t.timestamps
    end
  end
end
