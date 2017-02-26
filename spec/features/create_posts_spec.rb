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
end
