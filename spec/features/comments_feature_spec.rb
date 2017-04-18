require 'rails_helper'

feature 'commenting' do
  before {Picture.create postcomment: 'My first selfie'}

  scenario 'allows users to leave a comment using a form' do
     visit '/pictures'
     click_link 'Add a Comment'
     fill_in "comment[thoughts]", with: "That's a pretty nice picture!"
     click_button 'Leave Comment'

     expect(current_path).to eq '/pictures'
     expect(page).to have_content("That's a pretty nice picture!")
  end

end
