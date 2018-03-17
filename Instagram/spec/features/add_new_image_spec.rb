feature 'add new image' do
  scenario 'user fills in form to add image' do
    visit '/images'
    click_button 'Add an image'
    attach_file('image', "spec/files/images/test.jpg")
    fill_in 'user', with: 'Hannah'
    fill_in 'caption', with: 'Caption'
    click_button 'Add image'
    expect(page).to have_content('Caption')
    expect(page).to have_css("img[src*='test.jpg']")
  end
end
