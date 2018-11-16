puts "Starting the seed..."

def truncate(slogan, max)
  slogan.length > max ? "#{slogan[0...(max-3)]}..." : slogan
end


puts "Destroying old data..."
puts "Creating arenas so your friends don't have to fight in the street..."
puts "5 exotic arenas were just built for your fighting friends..."
puts "Creating friends for finding and fighting..."

5.times do
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
  rand(10).times do
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
  puts "A new user was given up to 4 purchases of up to 5 friends per purchase..."
end
puts "All done... Get ready to find and fight friends!"
