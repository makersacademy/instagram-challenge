require 'rails_helper'
feature 'Comments' do
# As a user
# So that I can show my appreciation for a picture
# I would like to 'like' a picture
  context 'when signed in' do
    let(:user){User.create(name: 'Betty Draper', email: 'betty@drapers.com',
                            username: 'bettydraper', password: 'pigeons123',
                            password_confirmation: 'pigeons123')}
    it 'allows users to \'like\' a picture' do
      sign_in(user.email, user.password)
      post_picture
      click_link '♥'
      expect(page).to have_content '1 like'
    end
  end

  context 'when not signed in' do
    let(:user){User.create(name: 'Betty Draper', email: 'betty@drapers.com',
                            username: 'bettydraper', password: 'pigeons123',
                            password_confirmation: 'pigeons123')}
    it 'prevents users from \'liking\' a picture' do
      sign_in(user.email, user.password)
      post_picture
      click_button 'Sign out'
      visit '/'
      click_link '♥'
      expect(page).not_to have_content '1 like'
    end
  end
end
