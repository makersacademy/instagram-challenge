feature 'liking a comment' do
  context 'clicking a "Like" link on homepage; logged out' do
    scenario 'cannot like a comment' do
      user = build :user
      sign_up user
      add_photo 'Testing', '#tag'
      leave_comment
      click_link 'Sign out'
      within '#photo0comment0' do
        click_link 'Like'
      end
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end
  end

  context 'clicking a "Like" link on homepage; logged in' do
    scenario 'can like a comment' do
      user = build :user
      sign_up user
      add_photo 'Testing', '#tag'
      leave_comment
      within '#photo0comment0' do
        click_link 'Like'
        click_link 'Like'
      end
      expect(page).to have_content '2 likes'
      expect(current_path).to eq '/photos'
    end
  end
end
