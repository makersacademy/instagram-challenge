
user = User.create(username: 'irina',
                   email: 'ira@mail.com',
                   password: '12345678',
                   password_confirmation: '12345678')

posts_list = [
  [ "India", '10787706_733625980091028_2025979476_n.jpg'],
  [ "Florida", '10953070_783986138316878_341724413_n.jpg' ],
  [ "Italy", '10254065_305160569667229_401382331_n.jpg']
]

posts_list.each do |post|
  Post.create( caption: post[0],
              image_file_name: post[1],
              user_id: user.id)
end