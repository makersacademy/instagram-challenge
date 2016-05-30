require 'rails_helper.rb'

feature 'Posts' do
  context 'no posts have been added' do
    scenario 'should display a prompt to add a post' do
      visit '/'
      expect(page).to have_content 'No posts yet'
      expect(page).to have_link 'New Post'
    end
  end
  context 'Create a new post' do
    scenario 'prompts user to fill out a form, then displays the new post' do
      visit '/'
      click_link 'New Post'
      attach_file('Image', "spec/files/images/pizza.jpg")
      fill_in 'Caption', with: 'delicious pizza #bestpizza'
      click_button 'Create Post'
      expect(page).to have_content('#bestpizza')
      expect(page).to have_css("img[src*='pizza.jpg']")
    end
  end
end
