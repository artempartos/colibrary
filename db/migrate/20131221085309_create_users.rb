class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :second_name
      t.string :last_name
      t.string :state
      t.string :password_digest
      t.string :confirmation_token
      t.string :reset_password_token
      t.string :avatar

      t.timestamps
    end
  end
end
