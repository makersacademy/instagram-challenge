# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

password = (0...8).map { (65 + rand(26)).chr }.join
User.create(name: "John Doe", email: "johndoe@email.com", password: password)

password = (0...8).map { (65 + rand(26)).chr }.join
User.create(name: "Steve Smith", email: "stevesmith@email.com", password: password)

password = (0...8).map { (65 + rand(26)).chr }.join
User.create(name: "Haley Smith", email: "haleysmith@email.com", password: password)

password = (0...8).map { (65 + rand(26)).chr }.join
User.create(name: "Francine Smith", email: "francinesmith@email.com", password: password)

password = (0...8).map { (65 + rand(26)).chr }.join
User.create(name: "Roger Smith", email: "rodersmith@email.com", password: password)

password = (0...8).map { (65 + rand(26)).chr }.join
User.create(name: "Peter Griffin", email: "petergriffin@email.com", password: password)

password = (0...8).map { (65 + rand(26)).chr }.join
User.create(name: "Peter Griffin", email: "jeffsmith@email.com", password: password)
