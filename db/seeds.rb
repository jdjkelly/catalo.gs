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
    Location.last.create_address(city: city, country: Faker::Address.country)
    Location.last.location_images.push(LocationImage.new(path: image_paths.sample, type: "featured"))
  end
end

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

5.times do
  answer = Answer.create(body: Faker::Lorem.paragraph(20), reputation: rand(25))
  Noun.each {|noun| noun.answers.push(answer)}
  City.each {|city| city.answers.push(answer)}
  Location.each {|location| location.answers.push(answer)}
end