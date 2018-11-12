# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Friend.destroy_all
Purchase.destroy_all



10.times do
user = User.create!(
  email: Faker::Internet.free_email,
  password: Faker::Internet.password,
  address: Faker::Address.street_address,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name
  )

rand(4).times do
  purchase = Purchase.create(
    total_price: Faker::Number.decimal(3, 2),
    user: user
    )
  rand(5).times do
    friend = Friend.create!(
      rating: Faker::Number.between(1, 10),
      strength: Faker::Number.between(1, 10),
      agility: Faker::Number.between(1, 10),
      weight: Faker::Number.between(1, 10),
      height: Faker::Number.between(1, 10),
      nationality: 'Germany',
      user: user,
      slogan: Faker::MichaelScott.quote,
      age: Faker::Number.between(5, 90),
      price: Faker::Number.between(1, 200),
      wins: Faker::Number.between(1, 10),
      losses: Faker::Number.between(1, 10),
      description: 'John',
      purchase: purchase
      )
    end
  end
end
