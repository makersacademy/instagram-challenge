feature 'adding tags' do
  context 'in the same form as creating new photo' do
    scenario 'can add tags to a photo' do
      user = build :user
      sign_up user
      click_link 'Add photo'
      fill_in 'Title', with: 'Testing'
      fill_in 'photo[tag][phrase]', with: '#tag0 #tag1'
      attach_file 'photo[image]', 'spec/fixtures/images/testing.jpg'
      click_button 'Upload photo'
      expect(page).to have_link '#tag0'
      expect(page).to have_link '#tag1'
      expect(current_path).to eq '/photos'
    end
  end
end
