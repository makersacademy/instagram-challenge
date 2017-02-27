require 'rails_helper'

feature 'commenting' do
  before { Post.create title: 'Poppy'}

  scenario 'allows user to add a comment on a post' do
    sign_up
    visit '/posts'
    click_link 'Comment'
    fill_in "Thoughts", with: "woof!"
    click_button 'Comment'
    expect(current_path).to eq '/posts'
  end

  scenario 'comments are displayed on /posts' do
    sign_up
    visit '/posts'
    click_link 'Comment'
    fill_in "Thoughts", with: "woof..woof!"
    click_button 'Comment'
    expect(current_path).to eq '/posts'
    click_link 'Poppy'
    expect(page).to have_content('woof..woof!')
  end
end
