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
    scenario 'going to a non-existant user\'s page redirects to sign in' do
      visit '/arukomp'
      expect(current_path).to eq '/users/sign_in'
    end
  end

  context 'Personalised feed' do

    before do
      sign_up(username: 'arukomp')
      create_photo(description: 'Autumn')
      sign_out
      sign_up(username: 'joe', email: 'joe@email.com')
    end

    scenario 'root page does not show photos from unfollowed users' do
      visit '/'
      expect(page).to_not have_content 'Autumn'
    end

    context 'when following a user' do

      before do
        visit '/arukomp'
        click_link 'Follow'
        visit '/'
      end

      scenario 'root page displays photos of a followed user' do
        expect(page).to have_content 'Autumn'
      end

      scenario 'displays photos in a descending order by time_created' do
        expect(page.find(".photo-container")).to have_content 'Autumn'
        create_photo(description: 'Winter')
        visit '/'
        expect(page.find(".photo-container", match: :first)).to have_content 'Winter'
        create_photo(description: 'Spring')
        visit '/'
        expect(page.find(".photo-container", match: :first)).to have_content 'Spring'
      end

      scenario 'unfollowing a user stops the feed from showing his/her photos' do
        visit '/arukomp'
        click_link 'Unfollow'
        visit '/'
        expect(page).to_not have_content 'Autumn'
      end

    end

  end

end
