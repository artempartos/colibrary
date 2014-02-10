class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string     :title
      t.string     :isbn, index: true
      t.string     :publisher
      t.references :company, index: true

      t.timestamps
    end
  end
end
