puts 'EMPTY THE MONGODB DATABASE, MR. WORF'
Mongoid.purge!

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

puts 'NOUNS ADDED, SIR'

puts 'ADD LOCATIONS, MR. WORF'

cords = [
  [-79.403285, 43.657366],
  [-79.387708, 43.672488],
  [-79.394042, 43.643444],
  [-79.407226, 43.656537],
  [-79.412017, 43.663896],
  [-79.412017, 43.663896],
  [-79.373536, 43.648587]
]

cords.each do |cord|
  Location.create(
    name: Faker::Company.name, 
    description: Faker::Lorem.paragraph(10), 
    coordinates: cord,
    city: "Toronto",
    country: "Canada",
    state: "Ontario",
    street_address: Faker::Address.street_address
  )
end
Location.each do |location|
  1..3.times do
    location.nouns.push(Noun.offset(rand(Noun.count)).first)
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
    answer = Answer.create(body: Faker::Lorem.paragraph(3))

    noun.answers.push(answer)
    user.answers.push(answer)
  end

  Answer.each do |answer|
    Location.offset(rand(Location.count)).first.answers.push(answer)
  end

end
puts 'ANSWERS FAKED, SIR'

puts ".... Engage\n\n

                         ___________________        ____....-----....____
                        (________________LL_)   ==============================
                            ______\\   \_______.--'.  `---..._____...---'
                            `-------..__            ` ,/
                                        `-._ -  -  - |
                                            `-------'



"
