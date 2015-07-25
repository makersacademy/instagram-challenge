require 'rails_helper'

feature 'comments' do
  before { Picture.create descr: 'Bae' }

  scenario 'allows a user to leave a comment' do
    visit '/pictures'
    click_link 'Comment on Bae'
    fill_in 'Comment', with: 'adorable'
    click_button 'Leave your comment'
    expect(current_path).to eq '/pictures'
    expect(page).to have_content 'adorable'
  end
end
