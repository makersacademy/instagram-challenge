require 'rails_helper'

feature 'comment' do
  before do
    user = User.create(email: 'ben@ben.com', password: 'benben')
    post = Post.create(description: 'Holiday', user: user)
  end

  scenario 'allows users to leave a comment using a form' do
    signup_and_in
    visit '/posts'
    click_link 'Comment on Holiday'
    fill_in "Comment", with: "Nice photo"
    click_button 'Leave comment'
    expect(current_path).to eq '/posts'
    expect(page).to have_content('Nice photo')
  end
end
