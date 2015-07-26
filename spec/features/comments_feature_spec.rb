require 'rails_helper'

feature 'comments' do
  before {Photo.create title: 'Best Burger'}

  scenario 'allows users to comment on photos' do
    visit '/photos'
    click_link 'Best Burger'
    click_link 'Comment'
    fill_in 'Thoughts', with: 'it really is'
    click_button 'Comment'

    expect(page).to have_content 'it really is'
  end
end
