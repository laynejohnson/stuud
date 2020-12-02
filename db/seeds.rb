# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Faker::Time.between_dates(from: Date.today - 1, to: Date.today, period: :day) #=> "2014-09-18 16:28:13 -0700"
# Faker::Address.full_address #=> "282 Kevin Brook, Imogeneborough, CA 58517"
# Faker::Name.first_name
# Faker::Name.last_name
# Faker::PhoneNumber.cell_phone
# Faker::Quotes::Shakespeare.as_you_like_it_quote
# Faker::TvShows::RickAndMorty.quote
# Faker::Quote.jack_handey
# Faker::Internet.email
require 'faker'


puts "Destroying database.."

Booking.destroy_all
User.destroy_all
Client.destroy_all
Event.destroy_all
Invoice.destroy_all
Expense.destroy_all

puts "Populating StüuD database.."




alex = User.create(
  email: "alex@email.com",
  password: "123456",
  first_name: "Alex",
  last_name: "Calvadillos"
)

20.times do
  client = Client.create!(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: Faker::Address.full_address,
    phone: Faker::PhoneNumber.cell_phone,
    color: %w[red yellow blue].sample,
    notes: Faker::TvShows::MichaelScott.quote,
    user: alex
  )
end

3.times do
 expense = Expense.create(
  date: Faker::Time.between_dates(from: Date.today - 60, to: Date.today + 20, period: :day),
  amount: 1000,
  name: "Rent",
  user: alex
)
end

3.times do
  expense = Expense.create(
   date: Faker::Time.between_dates(from: Date.today - 60, to: Date.today + 20, period: :day),
   amount: 500,
   name: "Utilities",
   user: alex
 )
 end

 3.times do
  expense = Expense.create(
   date: Faker::Time.between_dates(from: Date.today - 60, to: Date.today + 20, period: :day),
   amount: 250,
   name: "Car",
   user: alex
 )
 end

 3.times do
  expense = Expense.create(
   date: Faker::Time.between_dates(from: Date.today - 60, to: Date.today + 20, period: :day),
   amount: 200,
   name: "Insurance",
   user: alex
 )
 end

 starttime = []
 40.times do
  starttime << Faker::Time.between_dates(from: Date.today - 60, to: Date.today + 20, period: :day)
 end

starttime.each do |time|
 event = Event.create!(
  start_time: time,
  end_time: time + 1.hour,
  title: %w[practice lesson consultancy].sample,
  color: %w[yellow blue red orange].sample,
  price: %w[50 100 200 250].sample,
  payment_status: %w[true false].sample,
  user: alex,
  client: Client.ids[rand]
 )
end

puts " Done ! Enjoy Stüud "
puts " Default user alex@email.com pwd : 123456 "

