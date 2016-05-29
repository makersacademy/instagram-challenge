require 'rails_helper'

feature 'Deleting posts' do 
  background do 
    post = create(:post, caption: 'Nom nom delicious tacos')
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end

  scenario 'Users can delete a post from the single view page' do
    click_link 'Delete Post'
    expect(page).to have_content('Post deleted!')
    expect(page).to_not have_content('Nom nom delicious tacos') 
  end
end