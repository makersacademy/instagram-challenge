# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user = User.create! :email => 'doglover@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret'
user1 = User.create! :email => "aa@bb.com", :password => 'topsecret', :password_confirmation => 'topsecret'
posts = Post.create([{:id => 1, title: 'Poppy', desc:'Genteel bouncy lovingx lab',user_id: 1},
  {:id => 2, title: 'Conker', desc:'Chocolate labette always busy',user_id: 1},
  {:id => 3, title: 'Freddie', desc:'Collie incarnation of Lord Snooty',user_id: 1},
  {:id => 4, title: 'DeeDee', desc:'Foxy Jack Russell with attitude',user_id: 1},
  {:id => 5, title: 'Alphi', desc:'Lord Ribblesdale',user_id: 2},
  {:id => 6, title: 'Merlin', desc:'Black lab teen hooligan',user_id: 2}])


comments = Comment.create([{ thoughts:'Great toy fetcher',post_id: 1},
    { thoughts:'Dependable',post_id: 2},
    { thoughts:'Strong',post_id: 2},
    { thoughts:'Handsome',post_id: 3},
    { thoughts:'Quirky',post_id: 3},
    { thoughts:'Clever',post_id: 3},
    { thoughts:'She\'s in charge',post_id: 4},
    { thoughts:'She\'s been here before',post_id: 4},
    { thoughts:'He\'s so comfy',post_id: 5},
    { thoughts:'Noble hound',post_id: 5},
    { thoughts:'Ain\'t nobody going to keep me down!',post_id: 6},
    { thoughts:'Ain\'t nobody going to keep me down!',post_id: 6}
    ])
