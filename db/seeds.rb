# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Restaurant.destroy_all
Review.destroy_all

nobu = Restaurant.create(name: 'Nobu')
nobu.reviews.create(rating: 1, review: 'The fish was over a week old')
nobu.reviews.create(rating: 2, review: 'Full of oligarchs')
nobu.reviews.create(rating: 3, review: 'Good but not good')
nobu.reviews.create(rating: 4, review: 'Sushi Tetsu is better')
nobu.reviews.create(rating: 4, review: 'I\'d go again at half price')


hakkasan = Restaurant.create(name: 'Hakkasan')
hakkasan.reviews.create(rating: 1, review: 'Worse than my local takeaway')
hakkasan.reviews.create(rating: 1, review: 'Ordered dog. The dog tasted like chicken')
hakkasan.reviews.create(rating: 2, review: 'So dark I couldn\'t see my food')
hakkasan.reviews.create(rating: 5, review: 'Ordered dog. Tasted like dog')
hakkasan.reviews.create(rating: 5, review: 'Dim sum was pillows of love')
