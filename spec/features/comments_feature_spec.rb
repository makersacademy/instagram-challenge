require 'rails_helper'

feature 'comments' do
  before { Photograph.create name: 'Big Ocean' }

  scenario 'allows users to leave a comment using a form' do
     visit '/photographs'
     click_link 'Comment on Big Ocean'
     fill_in "Thoughts", with: "oceany"
     click_button 'Leave Comment'

     expect(current_path).to eq('/photographs')
     expect(page).to have_content('oceany')
  end

end
