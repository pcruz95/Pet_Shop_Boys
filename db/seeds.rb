puts "destroying bookings"
Booking.destroy_all

puts "destroying pets"
Pet.destroy_all

puts "destroying users"
User.destroy_all


addresses = [
  "Av. da República 46, 1050-195 Lisboa",
  "R. Duque de Palmela 34, 1250-098 Lisboa",
  "Calçada do Desterro 22, 1150-126 Lisboa",
  "Largo do Intendente Pina Manique Nº 6, 1100-285 Lisboa",
  "R. Barata Salgueiro 53, 1250-043 Lisboa",
  "R. Júlio César Machado 9, 1250-042 Lisboa",
  "Largo do Intendente Pina Manique Nº 6, 1100-285 Lisboa",
  "Av. Alm. Reis 35, 1150-018 Lisboa"
]

i = 0

puts "making users"
10.times do
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
      photo: File.new("#{Rails.root}/db/seed_images/animals/#{rand(1..4)}.jpg"),
      address: user.address,
      price: [5, 10, 25, 50].sample,
      animal_type: %w(dog cat sheep unicorn snake lion monkey giraffe)
    )
  end
end

puts "creating bookings"

pets = Pet.all
users = User.all

date1 = Time.now
date2 = Time.now + (60 * 60 * 24 * 31)

10.times do
  puts "creating a booking"
  random_start_date = Time.at((date2.to_f - date1.to_f)*rand + date1.to_f)
  random_end_date = random_start_date + (60 * 60 * 24 * rand(1..10))
  booking = Booking.create(
    user: users.sample,
    pet: pets.sample,
    start_date: random_start_date.to_date,
    end_date: random_end_date.to_date
  )
end
