require 'rails_helper'

feature 'likes' do

before do
  create_picture_with_user('kate@kate.com')
  sign_up('sylvia@sylvia.com')
end

scenario 'can like a picture' do
  visit '/pictures'
  click_button 'like'
  expect(page).to have_content '1 like'
end

scenario 'can see who liked a picture' do
  visit '/pictures'
  click_button 'like'
  click_link 'sign out'
  sign_up('sally@sally.com')
  click_link '1 like'
  expect(page).to have_content 'sylvia@sylvia.com'
end

end
