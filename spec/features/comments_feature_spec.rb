feature 'leaving comment on a photo' do
  context 'clicking a "comment" link on homepage; logged out' do
    scenario 'cannot leave comment on a photo' do
      user = build :user
      sign_up user
      add_photo 'Testing', '#tag'
      click_link 'Sign out'
      click_link 'Comment'
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
    end
  end

  context 'clicking a "comment" link on homepage; logged in' do
    scenario 'can leave comment on a photo' do
      user = build :user
      sign_up user
      add_photo 'Testing', '#tag'
      click_link 'Comment'
      expect(current_path).to eq '/photos/1/comments/new'
      fill_in 'Content', with: 'Nice!'
      click_button 'Submit'
      expect(page).to have_content 'Nice!'
      expect(current_path).to eq '/photos'
    end
  end
end

def leave_comment
  click_link 'Comment'
  fill_in 'Content', with: 'Nice!'
  click_button 'Submit'
end
