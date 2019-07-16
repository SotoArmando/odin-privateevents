# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

5.times do
 User.create(name:Faker::Name.name )

end

15.times do
  first =  User.first.events.build(title: Faker::Games::Pokemon.name,
                          description: Faker::Movies::BackToTheFuture.quote, date: 1.month.ago)

  first.save
end


15.times do
  second = User.second.events.build(title: Faker::Games::Pokemon.name,
                          description: Faker::Movies::BackToTheFuture.quote, date: 1.month.ago)
    second.save
end