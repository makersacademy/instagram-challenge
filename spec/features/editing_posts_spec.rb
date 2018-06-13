require 'rails_helper.rb'

describe 'Editing posts' do
  before(:each) do
    user = create(:user, email: 'another@gmail.com', password: 'password1')
    post_one = create(:post, caption: "This is post one")

    visit '/'
    click_link 'Login'
    fill_in 'Email', with: 'another@gmail.com'
    fill_in 'Password', with: 'password1'
    click_button 'Log in'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end

  feature 'Editing posts' do
    scenario 'can edit a post' do
      fill_in 'Caption', with: "I've just changed this!"
      click_button 'Update Post'
      expect(page).to have_content('Post updated')
      expect(page).to have_content("I've just changed this!")
    end

    scenario 'recieve an error message if an image is not included' do
      attach_file('Image', 'spec/files/misc.txt')
      click_button 'Update Post'
      expect(page).to have_content('Please ensure an image is posted')
    end
  end
end
