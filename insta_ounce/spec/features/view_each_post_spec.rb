require 'rails_helper'

feature "Viewing an individual post" do
  scenario 'user can view each post individually' do
    visit '/'
    click_link 'New Post'
    attach_file('Image', "spec/files/images/happy_puppy.jpg")
    fill_in 'Caption', with: '1st post'
    click_button 'Create Post'
    visit '/'
    find(:xpath, "//a[contains(@href,'posts/1')]").click
       expect(page).to have_content("1st post")
       expect(page).not_to have_content("2nd post")
  end
end
