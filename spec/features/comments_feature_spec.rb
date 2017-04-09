require 'rails_helper'

feature 'commenting' do

  before do
    sign_up
    add_photo
  end

  scenario "has a button to create a comment" do
    visit '/photos'
    expect(page).to have_button('Post comment')
  end

  scenario 'allows users to leave a comment on a photo' do
     visit '/photos'
     fill_in "comment_content", with: "Nice pic!"
     click_button 'Post comment'
     expect(current_path).to eq '/photos'
     expect(page).to have_content('Nice pic!')
  end

end
