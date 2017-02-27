def sign_up
  visit '/'
  click_button 'Join Instapic!'
  fill_in 'user_nickname', with: 'MakerJenny'
  fill_in 'user_email', with: 'jenny@makers.com'
  fill_in 'user_password', with: '123456'
  fill_in 'user_password_confirmation', with: '123456'
  click_button 'Sign up'
end

def share_instapic
  click_button 'Share Pic!'
  page.attach_file('instapic_image', Rails.root + 'app/assets/images/brunch.png')
  fill_in 'Description', with: 'Brunch for dinner!'
  click_button 'Share now'
end
