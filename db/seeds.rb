# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.create(email: "brucewayne@lja.com", password: "d4rknight")
Author.create(name: "Bruce Wayne", user: user1)
user2 = User.create(email: "clarkkent@lja.com", password: "m4nofst33l")
Author.create(name: "Clark Kent", user: user2)
user3 = User.create(email: "dianaprince@lja.com", password: "w0nd3rw0m4n")
Author.create(name: "Diana Prince", user: user3)
