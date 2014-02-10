class CreatePaperBooks < ActiveRecord::Migration
  def change
    create_table :paper_books do |t|
      t.references :book, index: true
      t.integer :count

      t.timestamps
    end
  end
end
