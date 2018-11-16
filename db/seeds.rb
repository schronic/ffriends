puts "Starting the seed..."

def truncate(slogan, max)
  slogan.length > max ? "#{slogan[0...(max-3)]}..." : slogan
end

Review.destroy_all
Arena.destroy_all
Reservation.destroy_all
Purchase.destroy_all
Friend.destroy_all
User.destroy_all

puts "Creating arenas so your friends don't have to fight in the street..."
puts "5 exotic arenas were just built for your fighting friends..."
puts "Creating friends for finding and fighting..."



2.times do
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


arenaa = Arena.new(
  name: 'Meeren',
  latitude: 30,
  longitude: 0
  )
  arenaa.remote_picture_url =  Cloudinary::Uploader.upload('https://creators-images.vice.com/content-images/contentimage/no-slug/356fc9f535c7ac9510fe5b438f1e098d.jpg?crop=0.9160493827160494xw%3A1xh%3Bcenter%2Ccenter&resize=2000%3A*')['url']
  arenaa.save!

arenab = Arena.new(
  name: 'Tyria',
  latitude: 58.3816,
  longitude: 34.6037
  )
  arenab.remote_picture_url =  Cloudinary::Uploader.upload('https://creators-images.vice.com/content-images/contentimage/no-slug/356fc9f535c7ac9510fe5b438f1e098d.jpg?crop=0.9160493827160494xw%3A1xh%3Bcenter%2Ccenter&resize=2000%3A*')['url']
  arenab.save!

arenac = Arena.new(
  name: 'Saatarh',
  latitude: 40.7128,
  longitude: 74.0060
  )
  arenacremote_picture_url =  Cloudinary::Uploader.upload('https://2.bp.blogspot.com/-3djK1nxKrh8/WTSY0pJUMiI/AAAAAAAAS_M/ohLUIO9-kzA1wIyGCPtC68krEJfWmRpfACLcB/s1600/Game-of-Thrones-Kings-Landing.jpg')['url']
  arenac.save!

arenae = Arena.new(
  name: 'Lannisport',
  latitude: 36.7783,
  longitude: 119.4179
  )
  arenae.remote_picture_url =  Cloudinary::Uploader.upload('https://vignette.wikia.nocookie.net/hieloyfuego/images/c/c1/Volantis_HBO.jpg/revision/latest?cb=20150427113329')['url']
  arenae.save!

arenad = Arena.new(
  name: 'Volantis',
  latitude: 31.0461,
  longitude: 34.8516
  )
  arenadremote_picture_url =  Cloudinary::Uploader.upload('https://vignette.wikia.nocookie.net/hieloyfuego/images/c/c1/Volantis_HBO.jpg/revision/latest?cb=20150427113329')['url']
  arenad.save!

