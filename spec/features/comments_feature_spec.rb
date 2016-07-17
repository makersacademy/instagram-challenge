require 'rails_helper'

feature 'leaving comments' do
  before { Post.create title: 'Title'}

  scenario 'allows users to leave a review using a form' do
    visit '/posts'
    click_link 'Add a comment'
    fill_in 'Thoughts', with: 'Nice'
    click_button 'Leave Comment'

    expect(current_path).to eq '/posts'
    expect(page).to have_content('Nice')
  end
end
