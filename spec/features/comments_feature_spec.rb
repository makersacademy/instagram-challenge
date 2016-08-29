require 'rails_helper'

feature 'Comments' do

  before do
    Photo.create(caption: "This is a photo")
  end

  scenario 'allows users comment on photos' do
    visit '/photos'
    click_link 'Comment'
    fill_in 'Comment', with: "Amazing photo"
    click_button 'Leave Comment'
    expect(page).to(have_content("Amazing photo"))
  end

end
