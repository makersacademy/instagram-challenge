require 'rails_helper'

feature 'Editing Posts' do
  before(:each) do
    post = create(:post)
    visit('/')
    find(:xpath, "//a/img[@alt='Monkey']/..").click
    click_link 'Edit Post'
  end

  scenario 'I can edit a post' do
    fill_in 'Caption', with: 'This is a bad pic'
    click_button 'Update Post'

    expect(page).to have_content('Post has been updated!')
    expect(page).to have_content('This is a bad pic')
  end

end
