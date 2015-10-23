feature 'liking a photo' do
  context 'clicking a "Like" link on homepage; logged out' do
    scenario 'cannot like a photo' do
      user = build :user
      sign_up user
      add_photo 'Testing', '#tag'
      click_link 'Sign out'
      click_link 'Like'
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end
  end

  context 'clicking a "Like" link on homepage; logged in' do
    scenario 'can like a photo' do
      user1 = build :user
      sign_up user1
      add_photo 'Testing', '#tag'
      click_link 'Like'
      click_link 'Sign out'
      user2 = build :user, email: 'testing2@testing.com'
      sign_up user2 
      click_link 'Like'
      expect(page).to have_content '2 likes'
      expect(current_path).to eq '/photos'
    end
  end

  context 'clicking a "like" link twice on homepage' do
    scenario 'can only like a photo once' do
      user = build :user
      sign_up user
      add_photo 'Testing', '#tag'
      click_link 'Like'
      click_link 'Like'
      expect(page).to have_content 'User can only like a photo once.'
      expect(current_path).to eq '/photos'
    end
  end
end
