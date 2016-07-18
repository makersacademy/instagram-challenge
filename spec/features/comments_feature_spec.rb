require 'rails_helper'

feature 'commenting' do

  before { Photo.create description: 'My lovely cat' }

  scenario 'allows users to leave a comment using a form' do
    visit '/photos'
    click_link 'My lovely cat'
    click_link 'Add comment'
    fill_in 'Comments', with: 'sooo cute'
    click_button 'Leave Comment'
    click_link 'My lovely cat'
    expect(page).to have_content 'sooo cute'
  end

end
