require_relative 'flat_url'

puts "Deleting the previous database"
Flat.destroy_all
puts "Adding 50 new flats"
50.times do
  flat = Flat.new(
    name: Faker::Lorem.sentence(word_count: 3, supplemental: true, random_words_to_add: 5),
    address: Faker::Address.full_address,
    description: Faker::Lorem.sentence(word_count: 20, supplemental: true, random_words_to_add: 30),
    price_per_night: rand(15..200),
    number_of_guests: rand(2..8),
    picture_url: flat_url
  )
  flat.save!
end
puts 'Completed'
