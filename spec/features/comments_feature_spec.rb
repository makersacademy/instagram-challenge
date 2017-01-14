require 'rails_helper'

feature 'commenting photos' do

  scenario 'user can leave comments on photo' do
    add_photo
    click_photo
    fill_in 'comment_text', with: 'Looks lovely <3'
    click_button 'Leave comment'
    expect(page).to have_content('Looks lovely <3')
  end

end
