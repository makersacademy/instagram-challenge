require 'rails_helper'

feature 'endorsing reviews' do
  before do
    snap = Picture.create(caption: 'snap')
    snap.comments.create(comment: 'awesome !!')
  end

  scenario 'a user can like a comment, which updates the comment like count' do
    visit '/pictures'
    click_link 'Like Comment'
    expect(page).to have_content('1 like')
  end

end
