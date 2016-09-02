require 'rails_helper'

feature 'commenting' do
  before {Post.create caption: 'Birthday'}

  scenario 'allows users to leave comments on a post' do
    visit '/posts'
    click_link 'Comment'
    fill_in "Comment", with: "amazing post"
    click_button 'Leave comment'

    expect(current_path).to eq '/posts'
    expect(page).to have_content('amazing post')
  end

end
