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
  arenaa.remote_picture_url =  Cloudinary::Uploader.upload('https://www.google.com.ar/search?biw=1299&bih=669&tbm=isch&sa=1&ei=MhDvW-TfJIKRwgSvgrXQBQ&q=meeren+got&oq=meeren+got&gs_l=img.3..0j0i24k1.1208.1964.0.2283.4.3.0.1.1.0.87.213.3.3.0....0...1c.1.64.img..0.4.216...0i5i30k1j0i10i24k1.0.49ekzBIYgCQ#imgrc=qkyq4tQdSUic-M:')['url']
  arenaa.save!

arenab = Arena.new(
  name: 'Tyria',
  latitude: 58.3816,
  longitude: 34.6037
  )
  arenab.remote_picture_url =  Cloudinary::Uploader.upload('https://www.google.com.ar/search?biw=1299&bih=669&tbm=isch&sa=1&ei=MhDvW-TfJIKRwgSvgrXQBQ&q=meeren+got&oq=meeren+got&gs_l=img.3..0j0i24k1.1208.1964.0.2283.4.3.0.1.1.0.87.213.3.3.0....0...1c.1.64.img..0.4.216...0i5i30k1j0i10i24k1.0.49ekzBIYgCQ#imgrc=qkyq4tQdSUic-M:')['url']
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
  arendaeremote_picture_url =  Cloudinary::Uploader.upload('https://vignette.wikia.nocookie.net/menirth/images/9/93/Port_little5.jpg/revision/latest?cb=20170728135612')['url']
  arendae.save!

arenad = Arena.new(
  name: 'Volantis',
  latitude: 31.0461,
  longitude: 34.8516
  )
  arenadremote_picture_url =  Cloudinary::Uploader.upload('https://www.google.com.ar/url?sa=i&source=images&cd=&cad=rja&uact=8&ved=2ahUKEwii-NPP0tneAhVJgZAKHcgYCY8QjRx6BAgBEAU&url=http%3A%2F%2Fhieloyfuego.wikia.com%2Fwiki%2FVolantis&psig=AOvVaw09f129MSEK3jVUGgFrfkpV&ust=1542482871493271')['url']
  arenad.save!

