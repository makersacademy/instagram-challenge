require 'rails_helper'

feature 'commenting' do
  before {Post.create name: 'Cheers!'}

  scenario 'allows users to leave a comment' do
     visit '/posts'
     click_link 'Leave comment'
     fill_in "Thoughts", with: "Salud!"
     click_button 'Leave comment'

     expect(current_path).to eq '/posts'
     # TODO: test this (comments are added, must display them on main page as well)
     # expect(page).to have_content('Salud!')
  end

end