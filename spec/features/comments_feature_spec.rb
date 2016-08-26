require 'rails_helper'

feature 'reviewing' do
  before {Post.create caption: '#Dogs'}

  scenario 'allow users to leave a comment using a form' do
    visit '/posts'
    click_link 'Comment'
    fill_in "Comment", with: "nice"
    click_button 'Leave Comment'

    expect(current_path).to eq '/post'
    expect(page).to have_content('nice')
  end
end
