require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  before do
    sign_up
  end

  scenario 'Provides a link to make a new post' do
    visit '/posts'
    click_link 'New Post'
    expect(current_path).to eq('/posts/new')
    expect(page.status_code).to eq(200)
  end

  scenario 'Posts are displayed in reverse chronological order' do
    make_a_post
    make_a_post(picture: Rails.root.join('spec/images/lena_river_siberia.png'),
                description: 'Endlessly reflecting the sky in its stillness')
    make_a_post(picture: Rails.root.join('spec/images/greenland.png'),
                description: 'Painted skies under an Arctic sunset')
    expect(page.all('.posts-index-description')[0])
      .to have_content('Painted skies under an Arctic sunset')
  end
end
