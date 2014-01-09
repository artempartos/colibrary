class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.references :user, index: true
      t.references :company, index: true

      t.timestamps
    end
  end
end
