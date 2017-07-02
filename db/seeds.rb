# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(email: 'bann_user@instabann.co', password: 'weakpassword1234')
Photo.create(name: 'Sunset Forest', photo_file: 'https://c.tadst.com/gfx/750w/sunrise-sunset-sun-calculator.jpg?1', user_id: 1)
Photo.create(name: 'Yosemite', photo_file: 'http://t.wallpaperweb.org/wallpaper/nature/1600x1200/Half_Dome_From_Olmstead_Point_Yosemite_National_Park_California.jpg', user_id: 1)
Photo.create(name: 'Harrop Tarn', photo_file: 'https://www.natureflip.com/sites/default/files/photo//harrop-tarn-a-winter-scene-of-the-tiny-harrop-tarn-in-the-mountains-of-the-lake-district-national.jpg', user_id: 1)
