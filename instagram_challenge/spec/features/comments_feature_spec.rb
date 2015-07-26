require 'rails_helper'

feature 'commenting' do
  before { Photo.create(title: 'Booya', caption: 'awesome') }

  scenario 'allows a user to comment on a photo' do
    visit '/'
    click_link 'Booya'
    click_link 'Leave a Comment'
    fill_in 'Comment', with: "great photo dude!"
    click_button 'Leave Comment'
    expect(current_path).to eq '/photos'
    expect(page).to have_content "great photo dude!"
  end
end
