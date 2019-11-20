puts "destroy reviews"
Review.destroy_all

puts "destroying bookings"
Booking.destroy_all

puts "destroying pets"
Pet.destroy_all

puts "destroying users"
User.destroy_all



addresses = [
  "Avenida da República, Lisboa",
  "Rua Duque de Palmela, Lisboa",
  "Calçada do Desterro, Lisboa",
  "Largo do Intendente Pina Manique, Lisboa",
  "Rua Barata Salgueiro, Lisboa",
  "Rua Júlio César Machado, Lisboa",
  "Largo do Intendente Pina Manique",
  "Avenida Almirante Reis, Lisboa"
]

i = 0

puts "making users"
15.times do
  puts "making a user"
  i += 1
  puts "email: #{i}@gmail.com, pwd: pwdpwd"
  user = User.create(
    email: "#{i}@gmail.com",
    password: 'pwdpwd',
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    address: addresses.sample,
    description: Faker::Lorem.sentence(word_count: rand(10..40)),
    photo: File.new("#{Rails.root}/db/seed_images/users/#{rand(1..4)}.jpg")
  )
  [0, 0, 1, 2].sample.times do
    puts "making pet"
    Pet.create!(
      user: user,
      name: Faker::Superhero.name,
      description: Faker::Lorem.sentence(word_count: rand(10..40)),
      photo: File.new("#{Rails.root}/db/seed_images/animals/#{rand(1..7)}.jpg"),
      address: user.address,
      price: [5, 10, 25, 50].sample,
      animal_type: %w(dog cat sheep unicorn snake lion monkey giraffe).sample
    )
  end
end

puts "creating bookings"

pets = Pet.all
users = User.all

date1 = Time.now
date2 = Time.now + (60 * 60 * 24 * 31)

15.times do
  puts "creating a booking"
  random_start_date = Time.at((date2.to_f - date1.to_f)*rand + date1.to_f)
  random_end_date = random_start_date + (60 * 60 * 24 * rand(1..10))
  booking = Booking.create(
    user: users.sample,
    pet: pets.sample,
    start_date: random_start_date.to_date,
    end_date: random_end_date.to_date
  )
  puts "creating review"
  Review.create(
    rating: rand(0..5),
    content: Faker::Lorem.sentence(word_count: rand(10..40)),
    booking: booking
  )
end
