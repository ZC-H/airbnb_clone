class ListingsController < ApplicationController
	def index
		@listings = Listing.all
	end

	def new
  	@listing = Listing.new
	end

	def create
	  @listing = Listing.new(listing_params)
	  @listing.user = current_user
	  if @listing.save
	    redirect_to @listing
	  else
	    render 'new'
	  end
	end

	def show
    @listing = Listing.find(params[:id])
	end

	private 
	def listing_params
	  params.require(:listing).permit(:name, :main_category, :listing_type, :beds, :bedrooms, :bathrooms, tag_ids: [])
	end

end
