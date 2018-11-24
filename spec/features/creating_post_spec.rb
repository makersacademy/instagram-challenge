require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/ArmyRyan.jpg")
    fill_in 'Caption', with: 'Did my makeup today #NoFilter'
    click_button 'Create Post'
    expect(page).to have_content('#NoFilter')
    expect(page).to have_css("img[src*='ArmyRyan.jpg']")
  end
end
