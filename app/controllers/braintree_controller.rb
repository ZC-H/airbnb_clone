class BraintreeController < ApplicationController
  def new
  end

  def checkout
    nonce_from_the_client = params[:checkout_form][:payment_method_nonce]

    @reservation = Reservation.create(JSON.parse params[:checkout_form][:reservation])

    if !@reservation.valid?
    	flash[:danger] = 'Error making reservation'
    	redirect_to @reservation.listing
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
      redirect_to current_user, :flash => { :success => "Transaction successful!" }
    else
      redirect_to current_user, :flash => { :error => "Transaction failed. Please try again." }
    end
  end

end
