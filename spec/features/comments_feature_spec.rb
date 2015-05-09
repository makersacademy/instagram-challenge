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

end
