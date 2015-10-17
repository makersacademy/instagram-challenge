require 'rails_helper'

feature 'comments' do
  before {Picture.create description: 'tower bridges'}

  scenario 'allows users to leave a comment using a form' do
     visit '/pictures'
     click_link 'Comment'
     fill_in "Comment", with: "great"
     click_button 'Leave Comment'

     expect(current_path).to eq '/pictures'
     expect(page).to have_content('great')
  end

  scenario 'comments deleted when picture deleted' do

    visit '/pictures'
    click_link 'Comment'
    fill_in "Comment", with: "great"
    click_button 'Leave Comment'
    click_link 'Delete'
    expect(current_path).to eq '/pictures'
    expect(page).to_not have_content('great')
  end

end
