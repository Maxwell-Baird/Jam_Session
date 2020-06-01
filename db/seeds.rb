# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

StudySession.destroy_all
User.destroy_all


user1 = User.create(
  name: 'Pablo D',
  email: 'user1@example.com',
  password: 'password'
)
user1.study_sessions.create(topic: "Ruby", duration: 50, paired: false)
user1.study_sessions.create(topic: "Ruby", duration: 30, paired: true)
user1.study_sessions.create(topic: "Cake", duration: 75, paired: true)
user1.study_sessions.create(topic: "Cheese", duration: 15, paired: false)
user1.study_sessions.create(topic: "Books", duration: 55, paired: false)
user1.study_sessions.create(topic: "Books", duration: 55, paired: false)
user2 = User.create(name: "Bob", email: 'user2@example.com', password: 'password')
user2.study_sessions.create(topic: "Cake", duration: 85, paired: true)
user2.study_sessions.create(topic: "Cheese", duration: 60, paired: false)
user2.study_sessions.create(topic: "Books", duration: 45, paired: false)
