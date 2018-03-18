feature 'add new image', js: true do
  scenario 'user fills in form to add image' do
    visit '/images'
    click_button 'Add an image'
    attach_file('image[image]', Rails.root + "app/assets/images/Capybara.jpg")
    fill_in 'image[user]', with: 'Hannah', visible: false
    fill_in 'image[caption]', with: 'Caption'
    click_button 'Create Image'
    expect(page).to have_css("img[src*='Capybara.jpg']")
  end
end
