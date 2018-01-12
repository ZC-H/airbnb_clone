class BraintreeController < ApplicationController
  def new
  end

  def checkout
    nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

    @reservation = Reservation.new(JSON.parse params[:checkout_form][:reservation])

    if !@reservation.valid?
    	flash[:danger] = 'Error making reservation'
    	redirect_to @reservation.listing
    	return
    end

    result = Braintree::Transaction.sale(
     :amount => @reservation.total_cost.to_s,
     :payment_method_nonce => nonce_from_the_client,
     :options => {
        :submit_for_settlement => true
      }
     )

    if result.success?
    	@reservation.save
      ReservationMailer.booking_email(@reservation.user, @reservation.listing.user, @reservation.id ).deliver_now #Can move this to a callback in the reservation model
      redirect_to current_user, :flash => { :success => "Transaction successful!" }
    else
      redirect_to current_user, :flash => { :error => "Transaction failed. Please try again." }
    end
  end

end
