require 'rails_helper.rb'

feature 'Creating posts' do
  background do
    user = create :user
    sign_in_with user
  end
  scenario 'can create a post' do
    visit '/'
    click_link 'New Post'
    attach_file('post_image', "spec/files/images/coffee.jpg")
    fill_in 'Add your caption', with: 'moomin #coffeetime'
    click_button 'Create Post'
    expect(page).to have_content('#coffeetime')
    expect(page).to have_css("img[src*='coffee.jpg']")
    expect(page).to have_content('testusername')
  end
  it 'needs an image to create a post' do
    visit '/'
    click_link 'New Post'
    fill_in 'Add your caption', with: "No picture because YOLO"
    click_button 'Create Post'
    expect(page).to have_content('Your post could not be created, please check your form or try again later.')
  end
end
