require './spec/support/web_helpers'

feature 'form validations', js: true do
  scenario 'user tries to add a new image without a caption' do
    visit '/images'
    click_button 'Add an image'
    attach_file('image[image]', Rails.root + "app/assets/images/Giraffe_CC.jpg")
    fill_in 'image[user]', with: 'Hannah', visible: false
    click_button 'Add image'
    expect(page).to have_content("Caption can't be blank")
  end

  scenario 'user tries to add a new image without a username' do
    visit '/images'
    click_button 'Add an image'
    attach_file('image[image]', Rails.root + "app/assets/images/Giraffe_CC.jpg")
    fill_in 'image[caption]', with: 'Grumpy Capybara'
    click_button 'Add image'
    expect(page).to have_content("User can't be blank")
  end

  scenario 'user tries to add a new image without uploading a file' do
    visit '/images'
    click_button 'Add an image'
    fill_in 'image[user]', with: 'Hannah', visible: false
    fill_in 'image[caption]', with: 'Grumpy Capybara'
    click_button 'Add image'
    expect(page).to have_content("Image can't be blank")
  end

  scenario 'user tries to add a new image with an invalid file type' do
    visit '/images'
    click_button 'Add an image'
    attach_file('image[image]', Rails.root + "app/assets/images/Untitled.pages")
    fill_in 'image[user]', with: 'Hannah', visible: false
    fill_in 'image[caption]', with: 'Grumpy Capybara'
    click_button 'Add image'
    expect(page).to have_content("Incorrect file type, please use .jpg or .png")
  end

  scenario 'user tries to add a comment without text' do
    add_an_image_of_giraffe
    find("img[src*='Giraffe_CC.jpg']").click
    fill_in 'comment[commenter]', with: 'Bob'
    click_button 'submit'
    expect(page).to have_content('Comment can\'t be blank')
  end

  scenario 'user tries to add a comment without their name' do
    add_an_image_of_giraffe
    find("img[src*='Giraffe_CC.jpg']").click
    fill_in 'comment[comment]', with: 'Love this picture!'
    click_button 'submit'
    expect(page).to have_content('Commenter can\'t be blank')
  end

end
