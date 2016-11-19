require 'rails_helper'

feature 'Photos' do

  context 'deleting posts' do

    it 'signed in user can delete a post' do
      visit '/'
      click_link 'Sign up'
      fill_in 'Email', with: "test@hotmail.com"
      fill_in 'Password', with: "123456"
      fill_in 'Password confirmation', with: "123456"
      click_button 'Sign up'
      expect(page).to(have_content("No photos yet"))
      click_link 'Add post'
      page.attach_file 'photo_image', "spec/images/toffee.jpg"
      fill_in 'Caption', with: 'Amazing doggie #toffee'
      click_button 'Create Photo'
      expect(page).to have_css "img[src*='toffee.jpg']"
      click_link "Delete photo"
      expect(page).to(have_content('Photo deleted successfully'))
      expect(page).not_to(have_css "img[src*='toffee.jpg']")
    end
  end
end
#     it 'a logged out user cannot add photos' do
#       visit '/photos'
#       expect(page).not_to(have_link('Add post'))
#     end
#
#     it  'in order to post a caption the user must add a photo' do
#       visit '/photos'
#       click_link 'Sign up'
#       fill_in 'Email', with: "test@hotmail.com"
#       fill_in 'Password', with: "123456"
#       fill_in 'Password confirmation', with: "123456"
#       click_button 'Sign up'
#       click_link 'Add post'
#       fill_in 'Caption', with: 'I am not adding a photo'
#       click_button 'Create Photo'
#       expect(page).to(have_content('Must include a photo'))
#      end
#   end
#
# end
