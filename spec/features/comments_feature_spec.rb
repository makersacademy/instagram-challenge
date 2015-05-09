require 'rails_helper'

feature 'Commenting' do

  before do
    sign_up_and_sign_in
    Image.create description: 'My face'
  end

  scenario 'allows users to comment on an image from the homepage' do
    visit '/images'
    click_link 'Comment on My face'
    fill_in "Comment", with: "so so"
    click_button 'Comment'
    expect(page).to have_content('so so')
  end

  scenario 'allows users to comment on an image from the image page' do
    visit '/images'
    click_link 'My face'
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

  scenario 'does not let you submit a comment of less than 3 characters' do
    visit '/images'
    click_link 'Comment on My face'
    fill_in 'Comment', with: 'so'
    click_button 'Comment'
    expect(page).to have_content 'Comment is too short'
  end

end
