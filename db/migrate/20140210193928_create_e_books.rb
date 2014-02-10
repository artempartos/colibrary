class CreateEBooks < ActiveRecord::Migration
  def change
    create_table :e_books do |t|
      t.references :book, index: true
      t.string :file

      t.timestamps
    end
  end
end
