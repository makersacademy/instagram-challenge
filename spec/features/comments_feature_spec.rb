require 'rails_helper'

feature 'Commenting' do
  before do
    sign_up_helper
    create_picture
  end

  scenario 'allows users to leave a comment using a form' do
     visit '/pictures'
     click_link('Comment', match: :first)
     fill_in "Content", with: "Guapo!"
     click_button 'Post'
     expect(page).to have_content('foo@bar.com')
     expect(page).to have_content('Guapo!')
  end

end