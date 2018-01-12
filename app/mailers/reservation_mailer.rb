class ReservationMailer < ApplicationMailer
	def booking_email(customer, host, reservation_id)
  @customer = customer
  @user = host
  @reservation = Reservation.find(reservation_id)
  mail(to: @user.email, subject: "Your listing " + @reservation.listing.name + " has been booked!")
  end
end