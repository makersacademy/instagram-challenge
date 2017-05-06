require 'rails_helper'

feature 'comments' do
  before { Picture.create caption: 'sally' }

  scenario 'users can comment on a picture' do
     visit '/pictures'
     fill_in 'any thoughts?', with: 'lovexxx'
     click_button 'comment'

     expect(current_path).to eq '/pictures'
     expect(page).to have_content('lovexxx')
  end

end
