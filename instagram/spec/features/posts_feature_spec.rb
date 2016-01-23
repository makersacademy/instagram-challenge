require 'rails_helper.rb'

feature 'Creating posts' do
  scenario 'can create post a pic' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/images/test.jpg")
    fill_in 'Caption', with: 'nice pic #nice'
    click_button 'Create Post'
    expect(page).to have_content('#nice')
  end
end
