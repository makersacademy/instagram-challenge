require 'rails_helper'

feature 'commenting' do

  scenario 'allows users to leave a comment on a post' do
    visit '/posts'
    click_link 'Post an Image'
    attach_file('Image', "#{Rails.root}/spec/support/uploads/cat.jpeg")
    click_button 'Create Post'
    click_link 'Comment'
    fill_in "Comment", with: "Love it!"
    click_button 'New Comment'

     expect(current_path).to eq '/posts'
     expect(page).to have_content('Love it!')
  end

end