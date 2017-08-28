require 'rails_helper.rb'

feature 'New posts' do
  scenario 'a user can create a new post' do
    sign_up
    click_link 'New Post'
    attach_file('Image', "spec/files/images/octopus.jpg")
    fill_in 'Caption', with: "Cephlapods are fascinating creatures. This is a blue ringed octopus - one of the most beautiful but poisonious creatures of the sea #octopus"
    click_button 'Post'
    expect(page).to have_content("#octopus")
    expect(page).to have_css("img[src*='octopus.jpg']")
  end
end
