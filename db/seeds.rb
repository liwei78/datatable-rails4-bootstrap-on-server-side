# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

random = Random.new
t = 100


50.times do
  Skill.create(name: Faker::Lorem.word)
end

t.times do
  worker = Worker.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    state: Faker::Address.state,
    city: Faker::Address.city,
    age: random.rand(20..50),
    salary: random.rand(50..500),
  )

  worker.skill_list = Skill.order("random()").limit(rand(1..10)).pluck("name").join(", ")
  worker.save
end
