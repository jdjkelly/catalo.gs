puts 'EMPTY THE MONGODB DATABASE, MR. WORF'
Mongoid.purge!

puts 'ADD CITIES, MR. WORF'
cities = [
  "New York",
  "Los Angele",
  "Chicago",
  "Houston",
  "Phoenix",
  "Philadelphia",
  "San Antonio",
  "San Diego",
  "Dallas"
]

city_images = [
  "cities/new-york.jpg"
]

cities.each do |city|
  City.create(name: city, latitude: rand(-100.0..100.0), longitude: rand(-100.0..100), image_path: city_images.sample)
end
puts 'CITIES ADDED, SIR'



puts 'ADD NOUNS, MR. WORF'
nouns = [
  "Headphones",
  "Manscapping tools",
  "Hardware",
  "Sports equipment",
  "Guitars",
  "Jeans",
  "Roasted coffee"
]

nouns.each do |noun|
  Noun.create(name: noun, description: Faker::Lorem.paragraph(10))
end

Noun.all.each do |noun|
  City.all.each do |city|
    noun.cities.push(city)
  end
end
puts 'NOUNS ADDED, SIR'

puts 'ADD LOCATIONS, MR. WORF'
locations = [
  "Barneys New York",
  "Belk",
  "Bloomingdale's",
  "The Bon-Ton",
  "Bergner's",
  "Boston Store",
  "Carson Pirie Scott",
  "Elder-Beerman",
  "Herberger's",
  "Parisian (Bon-Ton)",
  "Younkers",
  "Boscov's",
  "Dillard's",
  "JCPenney",
  "Kohl's",
  "Lord & Taylor",
  "Neiman Marcus",
  "Bergdorf Goodman",
  "Last Call Neiman Marcus",
  "Macy's",
  "Nordstrom",
  "Nordstrom Rack",
  "Saks Fifth Avenue",
  "Off 5th Saks Fifth Avenue Outlet",
  "Sears",
  "Sears Essentials",
  "Von Maur",
  "Dark Horse Coffee"
]

image_paths = [
  "locations/crema.jpg",
  "locations/dark-horse-coffee.jpg",
  "locations/embelished.jpg",
  "locations/skateshop.jpg"
]

locations.each do |location|
  City.all.each do |city|
    Location.create(city: city, name: location, description: Faker::Lorem.paragraph(10))
    Location.last.create_address(city: city.name, country: Faker::Address.country, state: Faker::Address.state, street_address: Faker::Address.street_address)
    Location.last.location_images.push(LocationImage.new(path: image_paths.sample, type: "featured"))
    1..3.times do
      Location.last.nouns.push(Noun.offset(rand(Noun.count)).first)
    end
  end
end
puts 'LOCATIONS ADDED, SIR'

puts 'SETTING UP DEFAULT USER LOGIN, MR. WORF'
user = User.create! :name => 'First User', :email => 'user@example.com', :password => 'please', :password_confirmation => 'please'
user.create_avatar(path: "users/josh.jpeg")
puts 'USER CREATED SIR: ' << user.name

puts 'FAKE SOME ANSWERS, MR. WORF'

5.times do

  user = User.first

  Noun.each do |noun| 
    City.each do |city|
      answer = Answer.create(body: Faker::Lorem.paragraph(3), reputation: rand(25))

      noun.answers.push(answer)
      city.answers.push(answer)
      user.answers.push(answer)
    end
  end

  Answer.each do |answer|
    Location.offset(rand(Location.count)).first.answers.push(answer)
  end

end
puts 'ANSWERS FAKED, SIR'

puts '.... Engage'