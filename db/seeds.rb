# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.destroy_all
category = ["Business", "Education", "Recreation", "Charity"]


100.times do
  Project.create(name: Faker::Commerce.product_name,
    description: Faker::Company.bs,
    funding_goal: rand(100000),
    start_date: Faker::Time.backward(14, :evening),
    end_date: Faker::Time.forward(23, :morning),
    category: category.sample,
    owner_id: rand(5))
end



