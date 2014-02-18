class AddBookOwner < ActiveRecord::Migration
  def change
    change_table :books do |t|
      t.references :owner, index: true
    end
  end
end
