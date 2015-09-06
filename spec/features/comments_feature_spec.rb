require 'rails_helper'

feature 'commenting' do
  before {Post.create text: 'I have a hot take'}

  scenario 'allows users to leave a comments using a form' do
     visit '/posts'
     click_link "Reply to post: I have a hot take"
     fill_in "Text", with: "You certainly do!"
     click_button 'Submit reply'
     expect(current_path).to eq '/posts'
     expect(page).to have_content('You certainly do!')
  end

end
