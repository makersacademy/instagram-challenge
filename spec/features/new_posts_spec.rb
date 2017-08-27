require 'rails_helper'

RSpec.feature 'New Posts', type: :feature do
  scenario 'A user can submit a post with a picture and description' do
    make_a_post
    expect(current_path).to eq('/posts')
    expect(page.status_code).to eq(200)
    expect(page).to have_css 'img.posts-index-picture'
    expect(page).to have_content('Humming birds taking a bath')
  end
end
