require 'rails_helper'
require 'web_helper'


feature 'comments' do
  before {Post.create description: 'Burger'}

  scenario 'allows users to leave a comment via a form' do
     visit '/posts'
     click_link 'Comment'
     fill_in "Comments", with: "tasty"
     click_button 'Leave Comment'

     expect(current_path).to eq '/posts'
     expect(page).to have_content('tasty')
  end
end
