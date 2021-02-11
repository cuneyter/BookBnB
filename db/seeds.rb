# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts 'Creating Users...'
5.times do
  user = User.new(
    email: Faker::Internet.email,
    password: '123456'
  )
  user.save!
  puts "User #{user.email} created"
end
puts 'Finished!'

puts 'Creating Flats...'
5.times do
  flat = Flat.new(
    city: Faker::Address.city,
    user_id: [1, 2].sample
  )
  flat.save!
  puts "Flat #{flat.city} created"
end
puts 'Finished!'

puts 'Creating Bookings...'
5.times do
  booking = Booking.new(
    flat_id: [1, 2, 3, 4, 5].sample,
    user_id: [1, 2, 3, 4, 5].sample
  )
  booking.save!
  puts "Booking #{booking.user_id} created"
end
puts 'Finished!'