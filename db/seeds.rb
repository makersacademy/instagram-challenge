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

post1 = Post.create(caption: 'I am the first seeded picture', user_id: 1)
post1.picture.attach(io: File.open(Rails.root + 'app/assets/images/test1.jpg'), filename: 'test1.jpg')

post2 = Post.create(caption: 'I am the second', user_id: 1)
post2.picture.attach(io: File.open(Rails.root + 'app/assets/images/test2.jpg'), filename: 'test2.jpg')

post3 = Post.create(caption: 'I am the third', user_id: 1)
post3.picture.attach(io: File.open(Rails.root + 'app/assets/images/test3.jpg'), filename: 'test3.jpg')
