require 'rails_helper'

feature 'liking photo posts' do
  before do
    sign_up
    create_photo_post
  end

  scenario 'a user can like a photo post, which updates the review endorsement count', js: true do
    visit '/photos'
    click_link 'Like Test photo'
    expect(page).to have_content '1 like'
  end

end
