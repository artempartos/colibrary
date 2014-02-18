class AddFieldsForBook < ActiveRecord::Migration
  def change
    change_table :books do |t|
      t.string :cover
      t.text   :details
    end
  end
end
