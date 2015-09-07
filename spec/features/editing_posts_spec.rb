require 'rails_helper'

feature 'Editing Posts' do
  before(:each) do
    user = create(:user)
    visit '/'
    click_link 'Sign In'
    sign_in(user)
    post = create(:post)
    visit '/'
    find(:xpath, "//a/img[@alt='Monkey']/..").click
    click_link 'Edit Post'
  end

  scenario 'I can edit a post' do
    fill_in 'Caption', with: 'This is a bad pic'
    click_button 'Update Post'

    expect(page).to have_content('Post has been updated!')
    expect(page).to have_content('This is a bad pic')
  end

  scenario "won't update a post without an image" do
    attach_file('Image', 'spec/files/images/monkey.jpg.zip')
    click_button 'Update Post'

    expect(page).to have_content('You need to upload a valid image!')
  end

end
