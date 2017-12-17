# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# Image.create(name: 'Lovely day', url: "https://i.pinimg.com/564x/f2/1c/ad/f21cad95c887d17f63d6f68b37c45e40.jpg")
# Image.create(name: 'My happy place', url: "https://i.pinimg.com/564x/14/34/39/143439ff909c87eeceb6e6fa367ad79d.jpg")
# Image.create(name: 'Life', url: "https://i.pinimg.com/564x/e3/24/83/e324832d6217925308eed5b2d9b4447d.jpg")
# Image.create(name: 'My happy place', url: "https://i.pinimg.com/564x/8f/db/e0/8fdbe076e135c2c284dbb3178392e9a7.jpg")
image = Image.create(name: 'YUM', url: "https://i.pinimg.com/564x/0b/b9/5b/0bb95be4cb76593bf2c9a11f8095e7c2.jpg")
reaction = image.reactions.create(comment: "That looks so good!", like: 1)
