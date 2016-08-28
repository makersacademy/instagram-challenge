require 'rails_helper'

feature 'comments' do
  scenario 'allows users to leave a comment using a form' do
    photograph_upload
    click_link 'Comment on sea'
    fill_in "Thoughts", with: "oceany"
    click_button 'Leave Comment'

     expect(current_path).to eq('/photographs')
     expect(page).to have_content('oceany')
  end

end
