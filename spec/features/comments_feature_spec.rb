feature 'leaving comment on a photo' do
  context 'clicking a "comment" link' do
    scenario 'can leave comment on a photo' do
      user = build :user
      sign_up user
      add_photo 'Testing'
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
