require 'rails_helper'

feature 'comments' do
  before { Photograph.create name: 'ocean' }

  scenario 'allows users to leave a comment using a form' do
     visit '/photographs'
     click_link 'Comment on ocean'
     fill_in "Thoughts", with: "oceany"
     click_button 'Leave Comment'

     expect(current_path).to eq('/photographs')
     expect(page).to have_content('oceany')
  end

end
