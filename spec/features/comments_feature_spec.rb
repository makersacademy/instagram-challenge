require 'rails_helper'
feature 'Comments' do
  # As a user
  # So that I can share my thoughts on a picture
  # I would like to write a comment on a picture
  context 'when signed in' do
  let!(:user){User.create(name: 'Betty Draper', email: 'betty@drapers.com',
                          username: 'bettydraper', password: 'pigeons123',
                          password_confirmation: 'pigeons123')}
  let(:picture){Picture.create(description: 'My picture', image: 'test.jpg',
                               user_id: user)}
    scenario 'a user can post a comment' do
      sign_in(user.email, user.password)
      post_picture
      click_link 'Comment'
      fill_in 'Comment', with: 'A nice comment'
      click_button 'Comment'
      expect(page).to have_content 'A nice comment'
    end
  end
end
