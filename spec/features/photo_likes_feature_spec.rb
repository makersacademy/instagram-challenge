feature 'liking a photo' do
  context 'clicking a "Like" link' do
    scenario 'can like a photo' do
      user = build :user
      sign_up user
      add_photo 'Testing'
      click_link 'Like'
      click_link 'Like'
      expect(page).to have_content '2 likes'
      expect(current_path).to eq '/photos'
    end
  end
end
