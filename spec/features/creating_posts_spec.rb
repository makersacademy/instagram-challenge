require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'can make a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/sunrise.jpg")
    fill_in 'Caption', with: "Amazing sunrise! #sunrise"
    click_button "Post"
    expect(page).to have_content "Amazing sunrise! #sunrise"
    expect(page).to have_css("img[src*='sunrise.jpg']")
  end
end
