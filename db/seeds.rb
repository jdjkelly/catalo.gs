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

cities.each do |city|
  City.create(name: city, latitude: rand(-100.0..100.0), longitude: rand(-100.0..100))
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
  "Von Maur"
]

locations.each do |location|
  City.all.each do |city|
      Location.create(city: city, name: location, description: Faker::Lorem.paragraph(10)).create_address(city: city, country: Faker::Address.country)
  end
end
