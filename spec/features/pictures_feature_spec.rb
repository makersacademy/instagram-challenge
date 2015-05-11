require 'rails_helper'
feature 'picture' do 

  context 'deleting a post' do
    scenario 'only a user who made it' do
      visit '/pictures'
      click_link "destroy"
      click_link "Ok"
      expect(page).to have_content('Post deleted successfully')
    end
  end

  context 'uploading an image' do
    scenario 'can upload an image' do
      visit '/'
      click_link 'Add a New Picture'
      attach_file('post_image', 'spec/Motley.png')
      fill_in :Description, with: 'Hello!'
      click_button 'Create Picture'
      expect(page).to have_xpath("//img[@alt='Testcat']")
    end
    end
  end
end