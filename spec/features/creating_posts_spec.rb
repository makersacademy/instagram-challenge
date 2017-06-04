require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'can create a post' do
    visit '/'
    click_link 'New post'
    attach_file('Image', "spec/files/images/guitar1.jpg")
    fill_in 'Caption', with: 'FIRST POST'
    click_button 'Create Post'
    expect(page).to have_content('#firstguitar')
    expect(page).to have_css("img[src*='guitar1.jpg']")
  end
end
