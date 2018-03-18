feature 'form validations', js: true do
  scenario 'user tries to add a new image without a caption' do
    visit '/images'
    click_button 'Add an image'
    attach_file('image[image]', Rails.root + "app/assets/images/Capybara.jpg")
    fill_in 'image[user]', with: 'Hannah', visible: false
    click_button 'Create Image'
    expect(page).to have_content("Caption can't be blank")
  end

  scenario 'user tries to add a new image without a username' do
    visit '/images'
    click_button 'Add an image'
    attach_file('image[image]', Rails.root + "app/assets/images/Capybara.jpg")
    fill_in 'image[caption]', with: 'Grumpy Capybara'
    click_button 'Create Image'
    expect(page).to have_content("User can't be blank")
  end

  scenario 'user tries to add a new image without uploading a file' do
    visit '/images'
    click_button 'Add an image'
    fill_in 'image[user]', with: 'Hannah', visible: false
    fill_in 'image[caption]', with: 'Grumpy Capybara'
    click_button 'Create Image'
    expect(page).to have_content("Image can't be blank")
  end

  scenario 'user tries to add a new image with an invalid file type' do
    visit '/images'
    click_button 'Add an image'
    attach_file('image[image]', Rails.root + "app/assets/images/Untitled.pages")
    fill_in 'image[user]', with: 'Hannah', visible: false
    fill_in 'image[caption]', with: 'Grumpy Capybara'
    click_button 'Create Image'
    expect(page).to have_content("Incorrect file type, please use .jpg or .png")
  end

end
