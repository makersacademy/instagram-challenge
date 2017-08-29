# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Comments', type: :feature do
  let! (:post) do
    { picture: Rails.root.join('spec/images/humming_birds.png'),
      description: 'Humming birds taking a bath' }
  end

  let! (:post2) do
    { picture: Rails.root.join('spec/images/lena_river_siberia.png'),
      description: 'Endlessly reflecting the sky in its stillness' }
  end

  # First post (displayed second, hence index 1) has two comments
  let! (:post_comment) do
    { comment: 'Adorable!', post_index: 1 }
  end

  let! (:post_comment2) do
    { comment: 'Wow...', post_index: 1 }
  end

  # Second post (displayed first, hence index 0) has one comment
  let! (:post2_comment) do
    { comment: 'What a fantastic picture', post_index: 0 }
  end

  before do
    sign_up
    make_a_post(post)
    make_a_post(post2)
  end

  scenario 'Comments can be added to a post' do
    make_a_comment(post_comment)
    make_a_comment(post_comment2)
    make_a_comment(post2_comment)

    expect(current_path).to eq('/posts')
    expect(page.status_code).to eq(200)

    within(page.all('.comments-comments')[1]) do
      expect(page.all('.comments-comment')[0]).to have_content(post_comment[:comment])
      expect(page.all('.comments-comment')[1]).to have_content(post_comment2[:comment])
    end
    within(page.all('.comments-comments')[0]) do
      expect(page.all('.comments-comment')[0]).to have_content(post2_comment[:comment])
    end
  end
end
