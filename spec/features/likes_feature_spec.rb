require 'rails_helper'

feature 'likes' do

before do
  User.create(email: 'kate@kate.com', password: '123456', password_confirmation: '123456')
  Picture.create(caption: 'sally', user: User.first)
  visit '/users/sign_up'
  fill_in 'email', with: 'sylvia@sylvia.com'
  fill_in 'password', with: '123456'
  fill_in 'password confirmation', with: '123456'
  click_button 'sign up'
end

scenario 'can like a picture' do
  visit '/pictures'
  click_link 'like'
  expect(page).to have_content 'sylvia@sylvia.com likes this'
end

end
