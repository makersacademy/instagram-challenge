require 'rails_helper'

feature 'deleting photos' do
  scenario 'displays a delete photo link' do
    post_photo
    expect(page).to have_link 'Delete this photo'
  end

  scenario 'lets a user delete a photo' do
   post_photo
   expect(page).to have_content 'test image of elephant'
   click_link 'Delete this photo'
   expect(current_path).to eq '/'
   expect(page).to have_content 'Photo deleted successfully'
  end 

   scenario 'only lets the owner delete the photo' do
    post_photo
    click_link 'Sign out'
    sign_up_2
    expect(page).not_to have_link 'Delete this photo'
  end
end
