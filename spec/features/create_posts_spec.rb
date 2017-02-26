require 'rails_helper.rb'

feature 'Creating posts works' do
  scenario 'via form that provides image and caption' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/sample_01.jpg")
    fill_in 'Caption', with: 'birdy birdy nomnom'
    click_button 'Create Post'
    expect(page).to have_content('nomnom')
    expect(page).to have_css("img[src*='sample_01.jpg']")
  end

  scenario 'and the image is compulsory' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: "This is a no-image post."
    click_button 'Create Post'
    expect(page).to have_content('Nope. Nope. You must provide an image!')
  end
end
