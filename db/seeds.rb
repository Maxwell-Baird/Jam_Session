# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

StudySession.destroy_all
User.destroy_all


user = User.create(
  name: 'Pablo D',
  email: 'test@example.com',
  password: 'password'
)
user.studySessions.create(topic: "Ruby", duration: 5, paired: false)
user.studySessions.create(topic: "Ruby", duration: 5, paired: true)
user.studySessions.create(topic: "Cake", duration: 5, paired: true)
user.studySessions.create(topic: "Cheese", duration: 5, paired: false)
user.studySessions.create(topic: "Books", duration: 5, paired: false)
user.studySessions.create(topic: "Books", duration: 5, paired: false)
