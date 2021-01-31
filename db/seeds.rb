# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
users = User.create([
  {
    username:"Merry Jane",
    email: "merry@email.com",
    profile_photo: 'https://media.gettyimages.com/photos/girl-friends-hanging-out-together-picture-id691865501?s=2048x2048',
    password: "password123"
  },
  {
    username: "Happy Panda",
    email: "happy.panda@email.com",
    profile_photo: "https://media.gettyimages.com/photos/couple-holding-heart-shaped-balloons-kissing-while-exploring-city-picture-id1187854704?s=2048x2048",
    password: "password123"
  },
  {
    username: "Lonely Crow",
    email: "lonely.crow@email.com",
    profile_photo: "https://media.gettyimages.com/photos/group-of-senior-women-smiling-portrait-picture-id200153697-003?s=2048x2048",
    password: "password123"
  },
  {
    username: "Dancing Queen",
    email: "queen@email.com",
    profile_photo: "https://media.gettyimages.com/photos/portrait-of-a-beautiful-african-american-woman-wearing-an-orange-head-picture-id1257959872?s=2048x2048",
    password: "password123"
  },
  {
    username: "Joy",
    email: "joy@email.com",
    profile_photo: "https://media.gettyimages.com/photos/walking-the-dog-picture-id90093291?s=2048x2048",
    password: "password123"
  },
  {
    username: "Foodie",
    email: "foodie@email.com",
    profile_photo: "https://media.gettyimages.com/photos/antioxidant-rich-papaya-smoothie-bowls-topped-with-banana-fresh-figs-picture-id1283195427?s=2048x2048",
    password: "password123"
  },
])

posts = Post.create([
  {
    user: users.first,
    image_url: 'https://specials-images.forbesimg.com/imageserve/5df99042e961e1000739542c/960x0.jpg?fit=scale'
  }
])