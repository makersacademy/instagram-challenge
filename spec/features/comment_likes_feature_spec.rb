feature 'liking a comment' do
  before do
    user = build :user
    sign_up user
    add_photo 'Testing', '#tag'
    leave_comment 'Nice!'
  end

  context 'clicking a "Like comment" link on homepage' do
    context 'logged out' do
      scenario 'cannot like a comment' do
        click_link 'Sign out'
        click_link 'Like comment'
        expect(page).to have_content 'You need to sign in or sign up before continuing.'
      end
    end

    context 'logged in' do
      scenario 'can like a comment' do
        click_link 'Like comment'
        click_link 'Sign out'
        user2 = build :user, email: 'testing2@testing.com'
        sign_up user2
        click_link 'Like comment'
        expect(page).to have_content '2 likes'
        expect(current_path).to eq '/photos'
      end
    end
  end

  context 'clicking a "Like comment" link' do
    scenario 'can only like a comment once' do
      click_link 'Like comment'
      click_link 'Like comment'
      expect(page).to have_content 'User can only like a comment once.'
    end
  end
end
