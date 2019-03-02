# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
many_post = User.create(email: "George.Manyposts@gmail.com", password: "gm1234")
one_post = User.create(email: "Percy.Onepost@gmail.com", password: "po1234")
few_post = User.create(email: "Sarah.Fewposts@gmail.com", password: "sf1234")
User.create(email: "Clare.Noposts@gmail.com", password: "cn1234")
Post.create(message: "A short post", user_id: many_post.id)
Post.create(message: "A medium length post of a single sentence of an average length", user_id: one_post.id)
Post.create(message: "A long and rambling post waffling on in great detail about nothing in particular taking up a lot of room, possibly over flowing the text box and causing all the formatting to mess up as I waffle on and aon about nothing in particular thinking of things to say and not really thinking of anything but nethertheless I continue to waffle on and on writing more and more of this post causing all the formatting to mess up and the test box keeps filling up and slowly the database starts to crash and the post still get longer but eventually when you think it will never end it just stops.", user_id: 2)
Post.create(message: "A medium length post of a single sentence of an average length. Number 2", user_id: many_post.id)
Post.create(message: "A medium length post of a single sentence of an average length. Number 3", user_id: many_post.id)
Post.create(message: "A medium length post of a single sentence of an average length. Number 4", user_id: few_post.id)
Post.create(message: "A post with a single \n newline to split the text box", user_id: many_post.id)
Post.create(message: "A post \n with \n a few \n newlines", user_id: few_post.id)
Post.create(message: "A medium length post of a single sentence of an average length. Number 5", user_id: many_post.id)
Post.create(message: "A medium length post of a single sentence of an average length. Number 6", user_id: many_post.id)
Post.create(message: "A medium length post of a single sentence of an average length. Number 7", user_id: many_post.id)
