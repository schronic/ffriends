puts "Starting the seed..."
puts "Destroying old data..."
puts "Creating new users,arenas..."

def truncate(slogan, max)
  slogan.length > max ? "#{slogan[0...(max-3)]}..." : slogan
end

Reservation.destroy_all
Friend.destroy_all
Purchase.destroy_all
User.destroy_all
Arena.destroy_all

5.times do
  arena = Arena.new(
    name: Faker::DragonBall.character,
    longitude: Faker::Address.longitude, #=> "-156.65548382095133"
    latitude: Faker::Address.latitude,
    capacity: Faker::Number.between(50, 100),
    level: Arena::LEVEL.sample,
    )
  arena.save!
end


10.times do
user = User.new(
  email: Faker::Internet.free_email,
  password: "ffriends",
  address: Faker::Address.street_address,
  first_name: Faker::Name.first_name,
  last_name: Faker::Name.last_name,
  )
user.save!
rand(4).times do
  purchase = Purchase.new(
    total_price: Faker::Number.decimal(3, 2),
    user: user
    )
  purchase.save!
  rand(5).times do
    slogan = Faker::MostInterestingManInTheWorld.quote
    short_slogan = truncate(slogan, 80)
    friend = Friend.new(
      rating: Friend::RATING.sample,
      strength: Friend::STRENGTH.sample,
      agility: Friend::AGILITY.sample,
      weight: Friend::WEIGHT.sample,
      height: Friend::HEIGHT.sample,
      nationality: Friend::NATIONALITY.sample,
      user: user,
      slogan: short_slogan,
      age: Faker::Number.between(5, 90),
      price: Faker::Number.between(1, 200),
      wins: Faker::Number.between(1, 10),
      losses: Faker::Number.between(1, 10),
      description: slogan,
      purchase: nil,
      )
      friend.remote_picture_url =  Cloudinary::Uploader.upload('https://picsum.photos/200/300/?random')['url']
      friend.save!
    end
  end
end
puts "3 Users were just created. Each user has purchases of a few friends! 5 Arenas were created"
