class ReservationsController < ApplicationController

	def create
		@reservation = current_user.reservations.new(reservation_params)
		@listing = Listing.find(params[:listing_id])
		@reservation.listing = @listing
	  if @reservation.save #valid?
	  	flash[:success] = 'Reservation successful'
	    redirect_to @listing
	  else
	  	@errors = @reservation.errors.full_messages
	  	flash[:danger] = 'Error making reservation'
	    render 'listings/show'
	  end
	end

	def destroy
		@reservation = Reservation.find(params[:id])
		@reservation.destroy
		redirect_to current_user
	end

	private 
	def reservation_params
	  params.require(:reservation).permit(:guest_num,:start_date,:end_date)
	end
end
