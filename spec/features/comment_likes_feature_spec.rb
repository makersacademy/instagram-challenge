feature 'liking a comment' do
  context 'clicking a "Like comment" link on homepage; logged out' do
    scenario 'cannot like a comment' do
      user = build :user
      sign_up user
      add_photo 'Testing', '#tag'
      leave_comment
      click_link 'Sign out'
      within '#photo0comment0' do
        click_link 'Like comment'
      end
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end
  end

  context 'clicking a "Like comment" link on homepage; logged in' do
    scenario 'can like a comment' do
      user1 = build :user
      sign_up user1
      add_photo 'Testing', '#tag'
      leave_comment
      within '#photo0comment0' do
        click_link 'Like comment'
      end
      click_link 'Sign out'
      user2 = build :user, email: 'testing2@testing.com'
      sign_up user2
      click_link 'Like comment'
      expect(page).to have_content '2 likes'
      expect(current_path).to eq '/photos'
    end
  end

  context 'clicking a "Like comment" link' do
    scenario 'can only like a comment once' do
      user = build :user
      sign_up user
      add_photo 'Testing', '#tag'
      leave_comment
      click_link 'Like comment'
      click_link 'Like comment'
      expect(page).to have_content 'User can only like a comment once.'
    end
  end
end
