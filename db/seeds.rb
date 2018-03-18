# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


pictures = Picture.create([
  { imgURL: "https://images.pexels.com/photos/440731/pexels-photo-440731.jpeg?h=350&auto=compress&cs=tinysrgb",
    description: 'Gorgeous field',
    user_id: 1},
  { imgURL: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSNIG6xE1NX-lPfJys3OjQvnox6OkZsZBrnB2FxknTbtTmvSrtN',
    description: 'Corny corn field',
    user_id: 1}])
pictures[0].comments.create(name: 'Marco Polo', comment: 'that field is FIRE', user_id: 1)
pictures[1].comments.create(name: 'Marcus Polonious', comment: 'I love dis field the most', user_id: 1)
