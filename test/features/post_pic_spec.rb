require 'test_helper' 
feature 'Creating posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'Gram it'
    attach_file('Image', 'app/assets/images/Scottish-Terrier.jpg')
    fill_in 'Title', with: 'The boys'
    fill_in 'Description', with: 'Handsome lads'
    click_button 'Create Picture'
    expect(page).to have_content('The boys')
    expect(page).to have_css("img[src*='Scottish-Terrier.jpg']")
  end
