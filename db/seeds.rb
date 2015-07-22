# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# category = ["Business", "Education", "Recreation", "Charity"]


50.times do
  Project.create(name: Faker::Company.name,
    description: Faker::Company.catch_phrase,
    funding_goal: rand(100000),
    start_date: Faker::Time.backward(14, :evening),
    end_date: Faker::Time.forward(23, :morning),
    # category: ["Business", "Education", "Recreation", "Charity"].rand(1))
  )
end

