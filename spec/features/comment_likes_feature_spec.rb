feature 'liking a comment' do
  context 'clicking a "Like" link' do
    scenario 'can like a comment' do
      user = build :user
      sign_up user
      add_photo 'Testing'
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
