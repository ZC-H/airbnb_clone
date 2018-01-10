class AddDatesToReservations < ActiveRecord::Migration[5.0]
  def change
  	add_column :reservations, :start_date, :date
  	add_column :reservations, :end_date, :date
  	add_column :reservations, :guest_num, :integer

  	add_column :listings, :max_guests, :integer
  end
end
