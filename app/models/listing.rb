class Listing < ApplicationRecord
	belongs_to	:user
	has_many 	:tagallocs
	has_many	:tags, :through => :tagallocs
	mount_uploaders :photos, ImageUploader
	serialize :photos, JSON
end
