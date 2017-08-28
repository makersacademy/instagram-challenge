require 'rails_helper'

RSpec.feature 'Posts', type: :feature do
  include ActionView::Helpers::DateHelper
  let! (:post) do
    { picture: Rails.root.join('spec/images/humming_birds.png'),
      description: 'Humming birds taking a bath' }
  end

  let! (:post2) do
    { picture: Rails.root.join('spec/images/lena_river_siberia.png'),
      description: 'Endlessly reflecting the sky in its stillness' }
  end

  let! (:post3) do
    { picture: Rails.root.join('spec/images/greenland.png'),
      description: 'Painted skies under an Arctic sunset' }
  end

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
    make_a_post(post)
    make_a_post(post2)
    make_a_post(post3)
    expect(page.all('.posts-index-description')[0]).to have_content(post3[:description])
    expect(page.all('.posts-index-description')[1]).to have_content(post2[:description])
    expect(page.all('.posts-index-description')[2]).to have_content(post[:description])
  end

  scenario 'Posts display the time when they were made' do
    time = Time.now
    make_a_post(post)
    expect(page.find('.posts-index-time')).to have_content(time_ago_in_words(time).capitalize)
  end
end
