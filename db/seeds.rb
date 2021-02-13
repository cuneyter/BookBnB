# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

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
10.times do
  flat = Flat.new(
    city: Faker::Address.city,
    address_line_1: Faker::Address.street_address,
    postcode: Faker::Address.postcode,
    price: Faker::Number.decimal(l_digits: 3, r_digits: 3),
    user_id: 1
  )
  flat.save!
  puts "Flat #{flat.city} created"
end
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