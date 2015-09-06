require 'rails_helper'

feature 'Editing Posts' do
  before(:each) do
    post = create(:post)
    visit('/')
    my_link = find(:xpath, "//a[contains(@href,'posts/1')]").click
  end

  scenario 'I can edit a post' do
    fill_in 'Caption', with: 'This is a bad pic'
    click_button 'Update Post'

    expect(page).to have_content('Post has been updated!')
    expect(page).to have_content('This is a bad pic')
  end

end
