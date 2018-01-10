class ListingsController < ApplicationController
	def index
		@listings = Listing.order(:id).page params[:page]
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
	def edit
  	@listing = Listing.find(params[:id])
  end
	def update
  	@listing = Listing.find(params[:id])
  	if @listing.update_attributes(listing_params)
      redirect_to @listing
    else
      render 'edit'
    end
	end


	private 
	def listing_params
	  params.require(:listing).permit(:name, :main_category, :listing_type, :beds, :bedrooms, :bathrooms, {photos: []}, tag_ids: [])
	end

end
