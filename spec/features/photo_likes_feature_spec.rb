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
      user = build :user
      sign_up user
      add_photo 'Testing', '#tag'
      click_link 'Like'
      click_link 'Like'
      expect(page).to have_content '2 likes'
      expect(current_path).to eq '/photos'
    end
  end
end
