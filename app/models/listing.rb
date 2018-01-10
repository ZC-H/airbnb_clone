class Listing < ApplicationRecord
	belongs_to	:user
	has_many 	:tagallocs
	has_many	:tags, :through => :tagallocs

	
	
end
