require 'rails_helper'

feature 'Feeds' do

  context 'User exists' do

    let!(:user) { User.create(email: 'test@test.com', password: 'password', username: 'arukomp') }

    scenario 'going to a particular user\'s page shows his/her feed' do
      visit "/#{user.username}"
      expect(page).to have_content "@#{user.username}'s Feed"
    end

    scenario 'can view and see another user\'s feed including pictures' do
      sign_in(email: 'test@test.com', password: 'password')
      create_photo(photo_url: 'hello.jpg', description: 'hello there')
      sign_out
      visit '/arukomp'
      expect(page).to have_xpath("//img[contains(@src, 'hello.jpg')]")
      expect(page).to have_content 'hello there'
    end

  end

  context 'User does NOT exist' do
    scenario 'going to a non-existant user\'s page redirects to root' do
      visit '/arukomp'
      expect(current_path).to eq '/'
    end
  end

end
