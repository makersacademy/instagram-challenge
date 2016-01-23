require 'rails_helper'

feature '<<comments>>' do
  let!(:pic) {Picture.create title:'Pirates' }

  scenario 'users may comment on an image' do
    visit '/pictures'
    click_link 'Pirates'
    click_link 'Post a comment...'
    fill_in 'Comment', with: 'Arggh!'
    fill_in 'Name', with: 'Blackbeard'
    click_button 'Post comment'
    expect(current_path).to eq "/restaurants/#{pic.id}"

  end

end
