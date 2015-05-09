require 'rails_helper'

feature 'Commenting' do

  before {Image.create description: 'My face'}

  scenario 'allows users to comment on an image' do
    visit '/images'
    click_link 'Comment on My face'
    fill_in "Comment", with: "so so"
    click_button 'Comment'
    expect(page).to have_content('so so')
  end

  scenario 'shows link back to homepage after commenting' do
    visit '/images'
    click_link 'Comment on My face'
    fill_in "Comment", with: "so so"
    click_button 'Comment'
    expect(page).to have_link('Homepage')
  end

  scenario 'does not let you submit a comment less than 3 characters' do
    visit '/images'
    click_link 'Comment on My face'
    fill_in 'Comment', with: 'so'
    click_button 'Comment'
    expect(page).to have_content 'Comment is too short'
  end

end
