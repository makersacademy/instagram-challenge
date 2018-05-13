require 'rails_helper'
describe 'Displaying posts' do
  before(:each) do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/dog.jpg")
    fill_in 'Caption', with: 'This is post one'
    click_button 'Create Post'
    click_link 'Instogram'
  end

  feature 'Index displays a list of posts' do
    scenario 'the index page creates the correct post information' do
      visit '/'
      click_link 'New Post'
      attach_file('Image', "spec/files/images/dog.jpg")
      fill_in 'Caption', with: 'This is post two'
      click_button 'Create Post'
      click_link 'Instogram'
      expect(page).to have_content("This is post one")
      expect(page).to have_content("This is post two")
      expect(page).to have_css("img[src*='dog']")
    end

    scenario 'each post has a link to take you to that post' do
      visit '/'
      find(:xpath, "//a[contains(@href,'posts/1')]").click
      expect(page).to have_content("This is post one")
      expect(page).to have_css("img[src*='dog']")
    end
  end
end
