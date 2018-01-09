class AddAddressAndUserDetails < ActiveRecord::Migration[5.0]
  def change
  	add_column :listings, :country, :string
  	add_column :listings, :state, :string
  	add_column :listings, :city, :string
  	add_column :listings, :zipcode, :string
  	add_column :listings, :address, :string
  	add_column :listings, :price, :integer
  	add_column :listings, :description, :string

  	add_column :users, :country, :string
  	add_column :users, :gender, :integer
  	add_column :users, :phone, :string
  	add_column :users, :birthdate, :date
  end
end
