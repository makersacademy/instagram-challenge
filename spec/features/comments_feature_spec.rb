require 'rails_helper'

feature 'comments' do

  before do
    add_post
  end

  scenario 'allow users to leave comments using a form' do
    visit '/posts'
    click_link 'image'
    click_link 'Comment'
    fill_in 'Comments', with: 'Nice!'
    click_button 'Comment'
    expect(page).to have_content 'Nice!'
  end
end
