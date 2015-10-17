require 'rails_helper'

feature 'commenting' do
  before do
    visit '/images/new'
    fill_in 'Name', with: 'Missing'
    attach_file(id="image_image", Rails.root + 'public/images/thumb/missing.png')
    click_button 'Create Image'
  end

  scenario 'allows users to leave comments using a form' do
     visit '/images'
     click_link 'Add comment'
     fill_in "Comment", with: "nice pic"
     click_button 'Leave Comment'

     expect(current_path).to eq '/images'
     expect(page).to have_content('nice pic')
  end
end
