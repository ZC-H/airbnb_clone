class AddPictures < ActiveRecord::Migration[5.0]
  def change
  	add_column :listings, :photos, :json
  	add_column :users, :avatar, :string
  end
end
