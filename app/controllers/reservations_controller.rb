class ReservationsController < ApplicationController

	def create
		@reservation = current_user.reservations.new(reservation_params)
		@listing = Listing.find(params[:listing_id])
		@reservation.listing = @listing
	  if @reservation.save
	  	flash[:success] = 'Reservation successful'
	    redirect_to @listing
	  else
	  	flash[:danger] = 'Error making reservation'
	    redirect_to @listing
	  end
	end

	def destroy
	end

	private 
	def reservation_params
	  params.require(:reservation).permit(:guest_num,:start_date,:end_date)
	end
end
