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
  first_name: 'Agent', 
  last_name: 'J', 
  email: 'agent@touringapp.com',
  password: 'agent123', 
  is_customer: 0, 
  is_agent: 1, 
  is_admin: 0,
  phone_number: '1800-12-1235',
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



20.times do
  User.create(
    first_name: Faker::Name.unique.first_name, 
    last_name: Faker::Name.last_name, 
    email: Faker::Internet.email,
    password: 'password', 
    is_customer: Faker::Boolean.boolean, 
    is_agent: Faker::Boolean.boolean, 
    is_admin: 0,
    phone_number: Faker::PhoneNumber.phone_number
  )
end