module Helpers
 def sign_in(user)
   visit '/'
   click_link 'Sign in'
   fill_in 'Email', with: user.email
   fill_in 'Password', with: user.password
   click_button 'Log in'
 end

 def sign_in_user2
   user2 = create :user, email: 'test123@gmail.com'
   sign_in(user2)
 end

 def create_image_n_sign_in
   image = create :post
   user = build :user
   sign_in(user)
 end
end
