require 'rails_helper'

feature 'leaving a comment' do

  scenario 'allows users to leave a comment on a photo' do
    post_a_photo
    click_link('comment')
    expect(current_path).to eq "/photos/1/comments/new"
    fill_in :Comment, with: 'Cool pic'
    click_button('comment')
    expect(current_path).to eq "/photos/1/comments/new"
    expect(page).to have_content 'Cool pic'
  end
end
