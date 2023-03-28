require 'rails_helper'

feature 'reviewing' do
  before { Post.create caption: 'Cake', id: 1 }

  scenario 'allows users to leave a review using a form' do
     visit '/posts'
     click_link 'Add a comment'
     fill_in "Comment", with: "Looks great!"
     click_button 'Comment'

     expect(current_path).to eq '/posts'
     expect(page).to have_content("Looks great!")
  end

end
