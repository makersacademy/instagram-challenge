require 'rails_helper'

feature 'adding pictures' do
  before { Picture.create title: 'Another cute pic' }

  scenario 'allows users to add a new picture using a form' do
     visit '/galleries'
     click_link 'Add picture'
     fill_in "Title", with: "Oh my god!"
     click_button 'Create Picture'

     expect(current_path).to eq '/galleries'
     expect(page).to have_content('Oh my god!')
  end

end
