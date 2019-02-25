require 'faker'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

# Examples:

#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create!([{
  first_name: 'Admin', 
  last_name: 'Admin', 
  email: 'admin@touringapp.com',
  password: 'admin123', 
  is_customer: 0, 
  is_agent: 0, 
  is_admin: 1,
  phone_number: '1800-12-1234',
}])
User.create!([{
  first_name: 'Customer', 
  last_name: 'K', 
  email: 'customer@touringapp.com',
  password: 'customer123', 
  is_customer: 1, 
  is_agent: 0, 
  is_admin: 0,
  phone_number: '1800-12-1236',
}])

User.create!([{
  first_name: 'Agent', 
  last_name: 'J', 
  email: 'agent@touringapp.com',
  password: 'agent123', 
  is_customer: 0, 
  is_agent: 1, 
  is_admin: 0,
  phone_number: '1800-12-1235',
}])

# Create 15 Agents
15.times do
  User.create(
    first_name: Faker::Name.unique.first_name, 
    last_name: Faker::Name.last_name, 
    email: Faker::Internet.email,
    password: 'password', 
    is_customer: 0, 
    is_agent: 1, 
    is_admin: 0,
    phone_number: Faker::PhoneNumber.phone_number
  )
end
# Create 10 Customers
10.times do
  User.create(
    first_name: Faker::Name.unique.first_name, 
    last_name: Faker::Name.last_name, 
    email: Faker::Internet.email,
    password: 'password', 
    is_customer: 1, 
    is_agent: 0, 
    is_admin: 0,
    phone_number: Faker::PhoneNumber.phone_number
  )
end

5.times do
  Tour.create(
    Name: Faker::Company.name, 
    Description: Faker::Marketing.buzzwords, 
    Price: Faker::Number.between(0, 3),
    start_date: Faker::Date.forward(30), 
    end_date: Faker::Date.between(1.month.from_now,2.month.from_now), 
    pickup: Faker::Boolean.boolean, 
    total_seats: Faker::Number.between(10, 90),
    status: "Active",
    booking_deadline: Faker::Date.forward(30),
    countries: Faker::Address.country,
    states: Faker::Address.state,
    user_id: 3
  )
end

10.times do
  Tour.create(
    Name: Faker::Company.name, 
    Description: Faker::Marketing.buzzwords, 
    Price: Faker::Number.between(0, 3),
    start_date: Faker::Date.forward(30), 
    end_date: Faker::Date.between(1.month.from_now,2.month.from_now), 
    pickup: Faker::Boolean.boolean, 
    total_seats: Faker::Number.between(10, 90),
    status: "Active",
    booking_deadline: Faker::Date.forward(30),
    countries: Faker::Address.country,
    states: Faker::Address.state,
    user_id: Faker::Number.between(3, 18)
  )
end