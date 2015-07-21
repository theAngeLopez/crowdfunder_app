# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.destroy_all

50.times do
  Project.create(name: Faker::Commerce.product_name, description: Faker::Company.catch_phrase, funding_goal: Faker::Number.between(1000,1000000), start_date: Faker::Date.forward(100), end_date: Faker::Date.forward(5))
end