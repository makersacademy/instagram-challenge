require 'rails_helper'

feature 'Commenting' do
  before {Picture.create description: 'Something'}
  scenario 'User can leave a comment' do
    visit '/pictures'
    click_link 'View picture'
    click_link 'Leave a comment'
    fill_in 'comment_content', with: 'Nice picture of food'
    click_button 'Comment'
    expect(page).to have_content 'Nice picture of food'
  end
end
