class AddAuthorFieldToBooks < ActiveRecord::Migration
  def change
    change_table :books do |t|
      t.string :author
    end
  end
end
