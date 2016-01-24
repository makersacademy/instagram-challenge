require 'rails_helper'

feature 'commenting' do
  before {Post.create(caption: 'a test caption')}

  scenario 'allows users to add comments to posts' do
    sign_up
    visit '/posts'
    click_link 'Comment'
    fill_in('Text', with: 'interesting photo')
    click_button('Comment')
    expect(page).to have_content('interesting photo')
  end
end
