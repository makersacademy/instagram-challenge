feature 'pictures' do
  scenario 'Should display a prompt to add a picture' do
    visit '/pictures'
    expect(page).to have_link 'Add a picture'
  end

  scenario 'user can fill out a form to add a picture' do
    visit '/pictures'
    click_link 'Add a picture'
    page.attach_file('picture[image]', Rails.root + 'spec/fixtures/test.jpg')
    fill_in 'Description', with: 'What a cool picture'
    click_button 'Create Picture'
    expect(page).to have_content 'What a cool picture'
    expect(current_path).to eq '/pictures'
  end

  context 'picture has been added' do
    before { Picture.create description: 'Look at my dinner', image_file_name: 'test.jpg'}
    scenario 'display picture descriptions' do
      visit '/pictures'
      expect(page).to have_content('Look at my dinner')
    end
  end

  context 'viewing pictures' do
    let!(:pic){Picture.create(description: 'something', image_file_name: 'test.jpg')}
    scenario do
      visit '/pictures'
      click_link 'View picture'
      expect(current_path).to eq "/pictures/#{pic.id}"
    end
  end

  context 'updating pictures' do
    before { Picture.create description: 'Something', image_file_name: 'test.jpg'}
    scenario 'User can edit a picture' do
      visit '/pictures'
      click_link 'View picture'
      click_link 'Edit picture'
      fill_in 'Description', with: 'Something different'
      click_button 'Update Picture'
      expect(page).to have_content 'Something different'
      expect(current_path).to eq '/pictures'
    end
  end

  context 'deleting pictures' do
    before { Picture.create description: 'Something', image_file_name: 'test.jpg'}
    scenario 'User can delete a picture and it deletes from database' do
      visit '/pictures'
      click_link 'View picture'
      click_link 'Delete picture'
      expect(page).not_to have_content 'Something'
      expect(page).to have_content 'Picture successfully deleted'
    end
  end
end
