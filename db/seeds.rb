puts "Seeding database..."
puts "*" * 30

puts "Destroying all records..."
User.destroy_all
Guest.destroy_all

puts "*" * 30

puts "Creating users..."
aimeric = User.create!(email: "testaimeric@test.fr", password: "password", admin: true)
stephanie = User.create!(email: "teststephanie@test.fr", password: "password", admin: true)
random = User.create!(email: "testrandom@test.fr", password: "password", admin: false)
puts "Users created!"

puts "*" * 30

puts "Creating guests..."
10.times do |i|
  Guest.create!(
    first_name: "first_name_#{i}",
    last_name: "last_name_#{i}",
    address: "address_#{i}",
    phone: "phone_#{i}",
    email: "email_#{i}",
    child: false,
    dinner_presence: [0, 1, 2].sample,
    brunch_presence: [0, 1, 2].sample,
    food_restriction: [0, 1, 2].sample
  )
end
puts "Guests created!"

puts "*" * 30

puts "Seeding done!"
