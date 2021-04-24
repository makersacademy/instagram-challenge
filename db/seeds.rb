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

descriptions = ["I'll never be called", 'Super cute, wish they were mine!', 'Ahhh puppies! Be still my heart!',
                'What a good boy! Makes me want another one!', 'This is the cutest! OMG!', 
                'Looooks sooooo soft! Gotta have em!', 'This is why I keep treats in my pocket!', 
                'What a handsome pair! Oh my lord!', 'Love the outdoors with my boy!', 
                "Guess who's getting a bath when we're home!"]

9.times do |i|
  Post.create(
    image: "https://placedog.net/300/300?id=#{i + 1}",
    user_id: '1',
    description: "#{descriptions[i + 1]}"
  )
end