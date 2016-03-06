require 'rails_helper'

feature 'Commenting' do

  scenario '-> allows users to leave a comment' do
    signup
    post_pic
    click_link('Comment')
    fill_in('Comment', with: 'What a greedy little boy')
    click_button('Post')
    expect(page).to have_content('What a greedy little boy')
  end
end
