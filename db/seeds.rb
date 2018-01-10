# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Seed Users
user = {}
user['password'] = 'aaaa'
#user['password_confirmation'] = 'aaaa'

ActiveRecord::Base.transaction do
  20.times do 
    user['name'] = Faker::Name.first_name + " " + Faker::Name.last_name
    user['email'] = Faker::Internet.email
    user['gender'] = rand(0..1)
    user['phone'] = Faker::PhoneNumber.phone_number
    user['country'] = Faker::Address.country
    user['birthdate'] = Faker::Date.between(50.years.ago, Date.today)
    User.create(user)
  end
end 

# Seed Listings
listing = {}
uids = []
User.all.each { |u| uids << u.id }

ActiveRecord::Base.transaction do
  40.times do 
    listing['name'] = Faker::App.name
    listing['main_category'] = ['Home','Hotel','Other'].sample #CHANGE
    listing['listing_type'] = ['Apartment',
										    'Condominium',
										    'Guesthouse',
										    'House',
										    'In-law',
										    'Guest Suite',
										    'Town House',
										    'Vacation Home',
										    'Other'].sample

    listing['bedrooms'] = rand(0..5)
    listing['beds'] = rand(1..6)
    listing['bathrooms'] = rand(0..4)

    listing['country'] = Faker::Address.country
    listing['state'] = Faker::Address.state
    listing['city'] = Faker::Address.city
    listing['zipcode'] = Faker::Address.zip_code
    listing['address'] = Faker::Address.street_address

    listing['price'] = rand(80..500)
    listing['description'] = Faker::Hipster.sentence

    listing['user_id'] = uids.sample
    # To include: Listing tags randomisation
    Listing.create(listing)
  end
end