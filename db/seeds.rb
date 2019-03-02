# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database
# with its default values.
# The data can then be loaded with the rails db:seed command (or created
#  alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' },
# { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_bob = User.create(
  email: 'bob@bob.com',
  password: 'bbbbbbb',
  username: 'bob',
  first_name: 'Bob',
  last_name: 'Bobson')
bob_post = Post.create(user_id: user_bob.id, resource_id: '1')
Comment.create(post_id: bob_post.id, user_id: user_bob.id, message: 'Great pic, me!')
Like.create(post_id: bob_post.id, user_id: user_bob.id)
Resource.create(post_id: bob_post.id, location: 'https://upload.wikimedia.org/wikipedia/commons/thumb/3/3e/A_butterfly_feeding_on_the_tears_of_a_turtle_in_Ecuador.jpg/1920px-A_butterfly_feeding_on_the_tears_of_a_turtle_in_Ecuador.jpg')
