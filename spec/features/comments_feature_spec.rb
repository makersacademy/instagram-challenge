require 'rails_helper'

feature 'comments' do

  before do
    Post.create(title: 'Holidays')
  end

  scenario 'allows user to leave a comment on a post' do
    visit '/posts'
    click_link 'Comment it'
    fill_in 'Comment', with: 'Wonderful place'
    click_button 'Comment it!'
    expect(current_path).to eq '/posts'
    expect(page).to have_content 'Wonderful place'
  end

end