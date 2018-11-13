
puts "Starting seeding process!"

puts "Destroy all old data..."

User.destroy_all
Friend.destroy_all
Purchase.destroy_all



3.times do
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
    friend = Friend.new(
      rating: Faker::Number.between(1, 5),
      strength: Faker::Number.between(1, 10),
      agility: Faker::Number.between(1, 10),
      weight: Faker::Number.between(1, 10),
      height: Faker::Number.between(1, 10),
      nationality: 'Germany',
      user: user,
      slogan: 'Faker::String.random(10..79)',
      age: Faker::Number.between(5, 90),
      price: Faker::Number.between(1, 200),
      wins: Faker::Number.between(1, 10),
      losses: Faker::Number.between(1, 10),
      description: 'John',
      purchase: purchase,
      )
      friend.remote_picture_url =  Cloudinary::Uploader.upload('https://picsum.photos/200/300/?random')['url']
      friend.save
    end
  end
end
