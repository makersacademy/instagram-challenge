require 'rails_helper'

feature 'likes' do

before do
  User.create(email: 'kate@kate.com', password: '123456', password_confirmation: '123456')
  Picture.create(caption: 'sally', user: User.first)
  sign_up('sylvia@sylvia.com')
end

scenario 'can like a picture' do
  visit '/pictures'
  click_link 'like'
  expect(page).to have_content '1 like'
end

end
