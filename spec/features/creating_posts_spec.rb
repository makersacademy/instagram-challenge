require 'rails_helper.rb'

feature 'Creating posts' do
  background do
    user = create(:user)

    visit '/'
    sign_in_with user
  end

  scenario 'can create a post' do
    click_link 'New Post'
    attach_file('post[image]', "spec/files/images/dog.jpg")
    fill_in 'post[caption]', with: 'Just taking a nap #zzz'
    click_button 'Create Post'
    expect(page).to have_content('#zzz')
    expect(page).to have_css("img[src*='dog.jpg']")
    expect(page).to have_content('Andrew')
  end

  scenario 'must include a photo' do
    visit '/'
    click_link 'New Post'
    fill_in 'post[caption]', with: 'This is a test'
    click_button 'Create Post'
    expect(page).to have_content('Please ensure an image is posted')
  end
end
