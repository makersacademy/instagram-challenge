feature 'adding tags to a photo' do
  context 'when creating a new photo' do
    scenario 'Can add tags to a photo' do
      user = build :user
      sign_up user
      click_link 'Add photo'
      fill_in 'Title', with: 'Testing'
      attach_file 'photo[image]', 'spec/fixtures/images/testing.jpg'
      fill_in 'photo[tag][phrase]', with: '#tag1 #tag2'
      click_button 'Upload photo'
      within '#photo0tag0' do
        expect(page).to have_content '#tag1'
      end
      within '#photo0tag1' do
        expect(page).to have_content '#tag2'
      end
      expect(current_path).to eq '/photos'
    end
  end
end
