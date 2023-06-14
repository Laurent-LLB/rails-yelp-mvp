# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'
# TODO: Write a seed to insert 10 posts in the database
Restaurant.destroy_all

Restaurant.create!(name:'zefrzrz', address:'zedaeae', phone_number:'azeaze', category:'italian')

5.times do
  items = Restaurant.new(
    name: Faker::Restaurant.name,
    address: Faker::Address.city,
    phone_number: Faker::PhoneNumber.cell_phone,
    category: ["chinese", "italian", "japanese", "french", "belgian"].sample
  )
  items.save!

  rand(0..3).times do
    newreview = Review.new(
      rating: rand(0..5),
      content: Faker::Restaurant.description,
      restaurant: items
    )
    newreview.save!
  end
end
