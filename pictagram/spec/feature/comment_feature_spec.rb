require 'rails_helper'

feature 'commenting' do
  before {Post.create comment: 'sunrise!'}

  scenario 'allows users to leave a comment using a form' do
     visit '/posts'
     click_link 'Comment sunrise!'
     fill_in 'comment[comment]', with: "cool pic!"
     click_button 'Leave Comment'

     expect(current_path).to eq '/posts'
     expect(page).to have_content('cool pic!')
  end

end
