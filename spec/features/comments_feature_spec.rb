require 'rails_helper'

feature 'commenting' do
  before {Post.create(description:'One day on holiday!')}

  scenario 'allows users to leave a comment using a form' do
     visit '/posts'
     click_link 'Comment on post'
     fill_in "Comment", with: "This is adorable!"
     click_button 'Post Comment'

     expect(current_path).to eq '/posts'
     expect(page).to have_content("This is adorable!")
  end

end
