require 'rails_helper'

feature 'deleting photos' do
  it 'displays a delete photo link' do
    post_photo
    expect(page).to have_link 'Delete this photo'
  end

  it 'lets a user delete a photo' do
   post_photo
   expect(page).to have_content 'test image of elephant'
   click_link 'Delete this photo'
   expect(current_path).to eq '/'
   expect(page).not_to have_content 'test image of elephant'
  end 
end
