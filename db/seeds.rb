# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create([
                {
                    first_name: 'Bob',
                    last_name: 'Tables',
                    username: 'bob',
                    password: 'bbbbbb',
                    email: 'bob@bob.com',
                    profile_pic: nil
                }])

Post.create([
                {
                    uri: 'I am a fake URI',
                    user_id: 1
                },
                {
                    uri: 'I am a new URI',
                    user_id: 1
                }
                ])

post = Post.create(uri: 'I have a seeded picture', user_id: 1)
puts
post.picture.attach(io: File.open(Rails.root + 'app/assets/images/test.jpg'), filename: 'test.jpg')
