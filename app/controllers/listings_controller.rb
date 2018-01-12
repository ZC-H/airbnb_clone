class ListingsController < ApplicationController
	before_action	:find_listing, only: [:show, :edit, :update]
	def find_listing
		@listing = Listing.find(params[:id])
	end

	def index
		@listings = Listing.order(:id).page params[:page]
	end

	def new
  	@listing = Listing.new
	end

	def create
	  @listing = current_user.listings.new(listing_params)
	  if @listing.save
	    redirect_to @listing
	  else
	    render 'new'
	  end
	end

	def show
		@reservation = Reservation.new
	end

	def edit
  end

	def update
  	if @listing.update_attributes(listing_params)
      redirect_to @listing
    else
    	flash[:danger] = "Error updating listing"
      render 'edit'
    end
	end


	private 
	def listing_params
	  params.require(:listing).permit(:name, :main_category, :listing_type, :beds, :bedrooms, :bathrooms, 
	  		:country, :state, :city, :zipcode, :address, :price, :description, :max_guests, {photos: []}, tag_ids: [])
	end

end
