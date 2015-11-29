require 'rails_helper'

feature 'Comments' do
  before {Picture.create title: 'My picture'}

  scenario 'allows users to leave a comment' do
     visit '/pictures'
     click_link 'Comment'
     fill_in "Notes", with: "so so"
     click_button 'Done'

     expect(current_path).to eq '/pictures'
     expect(page).to have_content('so so')
  end
end
