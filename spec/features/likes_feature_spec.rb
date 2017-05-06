require 'rails_helper'

feature 'liking posts' do
  before { Post.create description: "Nice", image:  File.open("#{Rails.root}/spec/fixtures/cat.png")}

  scenario 'a user can like a post, which updates the like count' do
    visit posts_path
    click_link('Like')
    expect(page).to have_content('1 like')
  end
end
