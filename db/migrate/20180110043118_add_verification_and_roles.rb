class AddVerificationAndRoles < ActiveRecord::Migration[5.0]
  def change
  	add_column :listings, :verified, :boolean
  	add_column :users, :role, :integer
  	User.all.each { |u| u.update(role: 0)}
  	Listing.all.each { |l| l.update(verified: false)}
  end
end
