require 'rails_helper.rb'

describe 'Editing posts' do
  before(:each) do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/dog.jpg")
    fill_in 'Caption', with: 'This is post one'
    click_button 'Create Post'
    click_link 'Instogram'
  end

  feature 'Editing posts' do
    scenario 'can edit a post' do
      visit '/'
      find(:xpath, "//a[contains(@href,'posts/1')]").click
      click_link 'Edit Post'
      fill_in 'Caption', with: "I've just changed this!"
      click_button 'Update Post'
      expect(page).to have_content('Post updated')
      expect(page).to have_content("I've just changed this!")
    end
  end
end
