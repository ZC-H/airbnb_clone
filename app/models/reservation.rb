class Reservation < ApplicationRecord
	belongs_to	:user
	belongs_to	:listing
	validate	:check_dates
	validate	:check_guests

	def check_dates
		if start_date < Date.today
			return errors.add(:invalid_date, "You cannot create a reservation for a date that has already passed.")
		end

		if start_date > Date.today + 365
			return errors.add(:date_too_far, "You can only make reservations up to one year in advance.")
		end

		listing.reservations.each do |res|
			if (start_date >= res.start_date && start_date <= res.end_date ) || (end_date >= res.start_date && end_date <= res.end_date )
				return errors.add(:dates_overlap, "The reservation dates overlap with existing bookings on this listing.")
			end
		end

	end

	def check_guests
		if guest_num > listing.max_guests
			return errors.add(:guest_number, "There are more guests than this listing can take.")
		end
		if guest_num < 1
			return errors.add(:guest_number, "More than zero guests must attend.")
		end
	end

	def length
		(end_date - start_date).to_i
	end

	def total_cost
		length * listing.price
	end

end
