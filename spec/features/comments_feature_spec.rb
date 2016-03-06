require 'rails_helper'
require_relative 'web_spec_helper'


feature 'comments' do
  before { sign_up }
  before { add_photo }

  scenario 'allows users to leave a comment' do
     visit '/photos'
     click_link 'Comment'
     fill_in "Comment", with: "Great picture"
     click_button 'Leave comment'

     expect(current_path).to eq '/photos'
     expect(page).to have_content('Great picture')
  end


end
