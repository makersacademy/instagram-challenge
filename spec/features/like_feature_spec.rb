require 'rails_helper'

feature 'Liking posts' do
  before do
    sign_up
    make_a_post
  end

  scenario 'users can like posts', js: true do
    click_link 'Like'
    expect(page).to have_content('1 like')
    expect(page).not_to have_link('Like')
    expect(page).to have_link('Unlike')
  end

  scenario 'user needs to be signed in to like posts', js: true do
    sign_out
    expect(page).not_to have_link('Like')
    expect(page).not_to have_link('Unlike')
  end
end
