require 'rails_helper.rb'

feature 'Create new picture post' do
  scenario 'can create a picture post' do
    visit '/'
    click_link 'Post Picture'
    attach_file('Image', "spec/files/images/coffee.jpg")
    fill_in 'Caption', with: 'nom nom nom #coffeetime' 
    click_button 'Create Post'
    expect(page).to have_content('#coffeetime')
    expect(page).to have_css("img[src*='coffee.jpg']")
  end
end