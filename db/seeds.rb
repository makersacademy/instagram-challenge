# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Post.delete_all

Post.create( image: "https://images.unsplash.com/photo-1538061621820-a2bfbfbb0c0e?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a668a3c10027d702d41e04222b045ef1&auto=format&fit=crop&w=2734&q=80", description: "Have some oranges. #orangeeaters")
Post.create( image: "https://images.unsplash.com/photo-1538140236132-5c9ca7cd0436?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=7a996461213711b629098b2e6210dfff&auto=format&fit=crop&w=2624&q=80", description: "Tasty. #heartattack")
Post.create( image: "https://images.unsplash.com/photo-1538054274783-71563ab54168?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=2b45f683f236c0931d22d16bf2e08028&auto=format&fit=crop&w=2850&q=80", description: "Atmospheric. #buslyfe")
Post.create( image: "https://images.unsplash.com/photo-1538061086561-561a593e2faf?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=3414318a36d1da60a92ee3b0342ae3cd&auto=format&fit=crop&w=1950&q=80", description: "Some description stuff. #pointlesstag")
Post.create( image: "https://images.unsplash.com/photo-1538032878394-f2331ae3f089?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=9d3f8d6d6270b5c1d041f1f300a36ea1&auto=format&fit=crop&w=1950&q=80", description: "How original. #birds")
Post.create( image: "https://images.unsplash.com/photo-1538045776425-45db48379336?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=42ab2fb593fea848dd8623a916ca6ae6&auto=format&fit=crop&w=1950&q=80", description: "Literally just a pic of a globe. #deep")