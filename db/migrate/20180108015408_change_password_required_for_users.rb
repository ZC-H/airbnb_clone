class ChangePasswordRequiredForUsers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :password_digest
  	change_column_null :users, :encrypted_password, true
  end
end
