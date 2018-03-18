feature 'image has its own page', js: true do
  scenario 'user clicks on image on homepage' do
    visit '/images'
    click_button 'Add an image'
    attach_file('image[image]', Rails.root + "app/assets/images/Capybara.jpg")
    fill_in 'image[user]', with: 'Hannah', visible: false
    fill_in 'image[caption]', with: 'Grumpy Capybara'
    click_button 'Create Image'
    find("img[src*='Capybara.jpg']").click
    expect(page).to have_content("Grumpy Capybara")
  end
end
