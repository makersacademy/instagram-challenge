require 'rails_helper'

feature 'endorsing comments' do
  before do
    snap = Picture.create(caption: 'snap')
    snap.comments.create(comment: 'awesome !!')
  end

  it 'a user can like a comment, which increments the like count', js: true do
    visit '/pictures'
    click_link 'Like'
    expect(page).to have_content("1 like")
  end

end
