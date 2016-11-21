require 'rails_helper'

feature 'commenting' do
  before { Picture.create name: 'My picture', description: "Fantastic pic" }

  scenario 'allows users to leave a comment using a form' do
     visit '/pictures'
     click_link 'Comment My picture'
     fill_in "comment_thoughts", with: "Yeah, not so bad"
     click_button 'Leave Comment'

     expect(current_path).to eq '/pictures'
     expect(page).to have_content('Yeah, not so bad')
  end

end
