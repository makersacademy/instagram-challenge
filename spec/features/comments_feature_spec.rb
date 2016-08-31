require 'rails_helper'

feature 'commenting' do
  before do
    sign_up_user1
    upload_photo
  end

  scenario 'allows users to leave comments' do
    visit '/photos'
    all('a.photo').first.click
    fill_in "comment_thoughts", with: "Beautiful photo. Love it <3"
    expect{ click_button 'Comment' }.to change{Comment.all.size}.by(1)
    expect(page).to have_content "Beautiful photo. Love it <3"
  end
end