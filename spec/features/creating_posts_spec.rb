require 'rails_helper.rb'

feature 'Creating posts' do
  background do
    user = create(:user)
    sign_in user
    click_link 'New Post'
  end

  scenario 'can create a post' do
    attach_file('Image', 'spec/images/1.jpeg')
    fill_in 'Description', with: 'Not Egypt #expensivegreenhouse'
    click_button 'Create Post'
    expect(page).to have_content('#expensivegreenhouse')
    expect(page).to have_css("img[src*='1.jpeg']")
    expect(page).to have_content('JoeBlogs')
  end

  scenario 'a post must have a picture attched to it' do
    fill_in 'Description', with: 'I hate having to use pictures'
    click_button 'Create Post'
    expect(page).to have_content('Why would you not attach a picture?')
    expect(page).not_to have_css("img[src*='1.jpeg']")
    expect(current_path).to eq '/posts'
  end
end
