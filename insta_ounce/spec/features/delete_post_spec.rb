require 'rails_helper'

feature "Delete an individual post" do
  scenario 'user can delete a post' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/happy_puppy.jpg")
    fill_in 'Caption', with: '1st post'
    click_button 'Create Post'
    click_link 'Delete Post'
       expect(page).not_to have_content("1st post")
  end
end
