class ExpandListings < ActiveRecord::Migration[5.0]
  def change
  	add_column :listings, :main_category, :string
  	add_column :listings, :listing_type, :string
  	add_column :listings, :guest_space, :string
  	add_column :listings, :beds, :integer
  	add_column :listings, :bedrooms, :integer
  	add_column :listings, :bathrooms, :integer


		create_table :tags do |t|
	    t.string	:name
	    t.timestamps
	  end

  	create_table :tagallocs do |t|
      t.belongs_to :listing
      t.belongs_to :tag
      t.timestamps
    end

    taglist = ['elevator',
							'free parking on premises',
							'pets allowed',
							'gym',
							'hot tub',
							'kitchen',
							'intercom',
							'wireless internet',
							'dryer',
							'cable TV',
							'family friendly',
							'doorman',
							'laptop friendly workspace',
							'suitable for events',
							'hair dryer',
							'breakfast',
							'iron',
							'hangers',
							'pool',
							'smoking allowed',
							'tv',
							'essentials',
							'heating',
							'washer',
							'air conditioning',
							'indoor fireplace',
							'private entrance',
							'ethernet connection']
		taglist.each { |t| Tag.create(name: t) }

  end
end
