# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.create(
  forename: 'Sadie', 
  surname: 'Smith', 
  username: 'ssmith', 
  email: 'ssmith@notadomain.com', 
  password: 'password1', 
  profile_picture: 'https://loremflickr.com/300/300'
)

9.times do
  Post.create(
    image: "https://loremflickr.com/300/300",
    user_id: '1',
    description: 'I love this one!'
  )
end