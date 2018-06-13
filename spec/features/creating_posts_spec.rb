require 'rails_helper.rb'

feature 'Creating posts' do
  before(:each) do
    user = create(:user)

    visit '/'
    click_link 'Login'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password1'
    click_button 'Log in'
  end

  scenario 'can create a post' do
    click_link 'New Post'
    attach_file('Image', "spec/files/images/dog.jpg")
    fill_in 'Caption', with: 'Just taking a nap #zzz'
    click_button 'Create Post'
    expect(page).to have_content('#zzz')
    expect(page).to have_css("img[src*='dog.jpg']")
  end

  scenario 'must include a photo' do
    visit '/'
    click_link 'New Post'
    fill_in 'Caption', with: 'This is a test'
    click_button 'Create Post'
    expect(page).to have_content('Please ensure an image is posted')
  end
end
