require 'rails_helper'

feature 'likes' do

before do
  create_picture_with_user
  sign_up('sylvia@sylvia.com')
end

scenario 'can like a picture' do
  visit '/pictures'
  click_button 'like'
  expect(page).to have_content '1 like'
end

end
