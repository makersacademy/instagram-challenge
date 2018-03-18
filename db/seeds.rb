# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user_1, user_2 = User.new, User.new
user_1.email = "lint@lint.com"
user_2.email = "linter@linter.com"
user_1.password = "iLoveLint"
user_2.password = "iLoveLintToo"
[user_1, user_2].each(&:save!)

picture_1_url = "https://img.thrfun.com/img/139/690/recycling_dryer_lint_l3.jpg"
picture_2_url = "https://cdn.instructables.com/F2S/HAGJ/F82EXR2W/F2SHAGJF82EXR2W.LARGE.jpg"
picture_3_url = "https://i1.wp.com/krinkle.net/wordpress/img/AppleMouse/TheDirtErrLint.jpg"
picture_4_url = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQR_X-G9TDXsvjPixHBZCMWxTXE5CuwAoiZ05FxvmMoh64DHFv"

picture_1 = Picture.create(url: picture_1_url, user_id: user_1.id)
picture_2 = Picture.create(url: picture_2_url, user_id: user_2.id)
picture_3 = Picture.create(url: picture_3_url, user_id: user_1.id)
Picture.create(url: picture_4_url, user_id: user_2.id)

Comment.create(body: "Great Lint!", picture_id: picture_1.id, user_id: user_1.id)
Comment.create(body: "This lint is ok.", picture_id: picture_1.id, user_id: user_2.id)
Comment.create(body: "Amazing lint!", picture_id: picture_2.id, user_id: user_1.id)
Comment.create(body: "You're wrong, this lint is terrible!", picture_id: picture_2.id, user_id: user_2.id)

Like.create(picture_id: picture_1.id, user_id: user_1.id)
Like.create(picture_id: picture_1.id, user_id: user_2.id)
Like.create(picture_id: picture_2.id, user_id: user_1.id)
Like.create(picture_id: picture_3.id, user_id: user_2.id)
