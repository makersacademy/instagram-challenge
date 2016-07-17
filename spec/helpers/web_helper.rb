def post_pic
  visit '/posts/new'
  fill_in('Caption', with: 'A lovely cat')
  attach_file('Pic', File.absolute_path("#{ Rails.root }/spec/support/platypus.jpg"))
  click_button('Create Post')
end

def sign_up
  visit '/users/sign_up'
  fill_in 'Email', with: "ken@ken.com"
  fill_in 'User name', with: "kennbarr"
  fill_in 'Password', with: "123456"
  fill_in 'Password confirmation', with: "123456"
  click_button 'Sign up'
end
