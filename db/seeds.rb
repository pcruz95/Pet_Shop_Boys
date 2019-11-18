puts "destroying bookings"
Booking.destroy_all

puts "destroying pets"
Pets.destroy_all

puts "destroying users"
User.destroy_all

puts "puts making users"
20.times do
  puts "making a user"
  user = User.new(
          first_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          address: "#{Faker::Address.street_address}, #{Faker::Address.city}, #{Faker::Address.country}",
          description: Faker::Lorem.sentence(word_count: rand(10..40)),
          photo: File.new("#{Rails.root}/db/seed_images/users/#{rand(1..4)}.jpg")
        )
  user.email = Faker::Internet.email,
  user.encrypted_password = 'pwdpwd'
  user.save!
  [0, 0, 0, 1, 2].sample.times do
    puts "making pet"
    pet = Pet.create(
      name: Faker::Superhero.name,
      description: Faker::Lorem.sentence(word_count: rand(10..40)),
      photo: File.new("#{Rails.root}/db/seed_images/animals/#{rand(1..4)}.jpg"),
      address: user.address,
      price: [5, 10, 25, 50].sample,
      animal_type: %w(dog cat sheep unicorn snake lion monkey giraffe)
    )
    pet.user = user
  end
end

puts "creating bookings"
30.times do
  booking = Booking.create(

            )
end

# create_table "bookings", force: :cascade do |t|
#   t.bigint "user_id"
#   t.bigint "pet_id"
#   t.date "start_date", null: false
#   t.date "end_date", null: false
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["pet_id"], name: "index_bookings_on_pet_id"
#   t.index ["user_id"], name: "index_bookings_on_user_id"



# create_table "pets", force: :cascade do |t|
#   t.bigint "user_id"
#   t.string "name", null: false
#   t.string "description"
#   t.string "photo"
#   t.string "address"
#   t.integer "price"
#   t.string "animal_type"
#   t.datetime "created_at", null: false
#   t.datetime "updated_at", null: false
#   t.index ["user_id"], name: "index_pets_on_user_id"


  # create_table "users", force: :cascade do |t|
  #   t.string "first_name"
  #   t.string "last_name"
  #   t.string "address"
  #   t.string "description"
  #   t.string "photo"
  #   t.string "email", default: "", null: false
  #   t.string "encrypted_password", default: "", null: false
  #   t.string "reset_password_token"
  #   t.datetime "reset_password_sent_at"
  #   t.datetime "remember_created_at"
  #   t.datetime "created_at", null: false
  #   t.datetime "updated_at", null: false
  #   t.index ["email"], name: "index_users_on_email", unique: true
  #   t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
