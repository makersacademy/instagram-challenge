require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/petticoatlane.jpg")
    fill_in 'Caption', with: 'petticoat lane #london'
    click_button 'Create Post'
    expect(page).to have_content('#london')
    expect(page).to have_css("img[src*='petticoatlane.jpg']")
  end
end
