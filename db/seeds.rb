# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "faker"
10.times.each do
    User.create(name: Faker::Name.name, email: Faker::Internet.email, contact_phone:"21998111889", gender: rand(0..1), nickname: Faker::Name.first_name, birthdate: "01/01/2000")
end
15.times.each do
    Post.create(content_text: Faker::Lorem.paragraph_by_chars(number: 256, supplemental: false), user_id:rand(1..10))
end
