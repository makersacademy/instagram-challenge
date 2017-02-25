require 'rails_helper'

feature 'Adding Comments' do
  before { create_post }

  scenario 'allows users to leave a comment using a form' do
     visit '/posts'
     click_link 'Add a comment'
     fill_in "Comment", with: "nice pic!"
     click_button 'Submit'

     expect(current_path).to eq '/posts'
     expect(page).to have_content('nice pic!')
  end

end
