require 'rails_helper.rb'

feature "Creating a new post" do
  scenario 'user can create a new post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/happy_puppy.jpg")
    fill_in 'Caption', with: 'something witty #weekend'
    click_button 'Create Post'
    expect(page).to have_content('#weekend')
    expect(page).to have_css("img[src*='happy_puppy.jpg']")
  end
end
