# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require "open-uri"

# puts 'Cleaning up database'
# Booking.destroy_all
# Flat.destroy_all
# puts 'Database is clean'

puts 'Creating Users...'
5.times do
  user = User.new(
    email: Faker::Internet.email(domain: 'example'),
    password: '123456'
  )
  user.save!
  puts "User #{user.email} created"
end
puts 'Finished!'

puts 'Creating Flats...'

def create_flat_with_photo(uri)
  file = URI.open("#{uri}")
  flat = Flat.new(
    city: Faker::Address.city,
    address_line_1: Faker::Address.street_address,
    postcode: Faker::Address.postcode,
    price: Faker::Number.decimal(l_digits: 3, r_digits: 3),
    user_id: 1
  )
  flat.photos.attach(io: file, filename: 'nes.png', content_type: 'image/png')
  flat.save!
  puts "Flat #{flat.city} created"
end

create_flat_with_photo("https://i2-prod.coventrytelegraph.net/incoming/article18654956.ece/ALTERNATES/s615/0_central-eating-547972.jpg")
create_flat_with_photo("https://cf.bstatic.com/images/hotel/max1024x768/120/120210585.jpg")
create_flat_with_photo("https://www.rightmove.co.uk/news/content/uploads/2018/03/61682_3995232_IMG_01_0000.jpg")
create_flat_with_photo("https://page-assets.foxtons.co.uk/news-images/2018/01/property-1/720.jpg")
create_flat_with_photo("https://cf.bstatic.com/images/hotel/max1024x768/150/150368014.jpg")
create_flat_with_photo("https://www.thetimes.co.uk/imageserver/image/%2Fmethode%2Ftimes%2Fprod%2Fweb%2Fbin%2Fc7f42326-e2fc-11e6-802a-dc53f5401bb9.jpg?crop=1449%2C815%2C3%2C72&resize=1180")
create_flat_with_photo("https://q-xx.bstatic.com/xdata/images/hotel/840x460/250999347.jpg?k=6d7d9a5176c36a193f5e20a5e3e72e8ae3868d582f507034df14bcc097cd403e&o=")
create_flat_with_photo("https://www.designingbuildings.co.uk/w/images/a/a8/Studioflat.jpg")
create_flat_with_photo("https://www.taylorwimpey.co.uk/-/media/Regions/North%20Thames/Sales/Beaumont%20Gardens/Refurb%20Webfiles/CGIs/Flat-1-Livingroom.jpg")
create_flat_with_photo("https://q-xx.bstatic.com/xdata/images/hotel/840x460/76109618.jpg?k=ba537b048279407e0241cbd138c6dced32572a4f864bdaf5dbb60c314c3003b0&o=")

puts 'Finished!'

puts 'Creating Bookings...'
10.times do
  booking = Booking.new(
    flat_id: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10].sample,
    user_id: [1, 2, 3, 4, 5].sample,
    start_date: Faker::Date.between(from: '2022-09-23', to: '2025-09-25'),
    end_date: Faker::Date.between(from: '2022-09-23', to: '2025-09-25')
  )
  booking.save!
  puts "Booking #{booking.user_id} created"
end
puts 'Finished!'
