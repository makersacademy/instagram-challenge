require 'rails_helper'
include UsersHelper
include PhotosHelper

feature 'reviewing' do
  before {  user = build :user
            sign_up user
            create_photo }

  scenario 'allows users to leave a comment on a photo' do
     click_link 'Comment on Test Title'
     fill_in "Comment", with: "Awesome!"
     click_button 'Leave Comment'

     expect(current_path).to eq '/photos'
     expect(page).to have_content('Awesome!')
  end

end
