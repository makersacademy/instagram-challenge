# frozen_string_literal: true

require 'application_system_test_case'

class LikesTest < ApplicationSystemTestCase
  setup do
    @like = likes(:one)
  end

  test 'visiting the index' do
    visit likes_url
    assert_selector 'h1', text: 'Likes'
  end

  test 'creating a Like' do
    visit likes_url
    click_on 'New Like'

    fill_in 'Post', with: @like.post_id
    fill_in 'User', with: @like.user_id
    click_on 'Create Like'

    assert_text 'Like was successfully created'
    click_on 'Back'
  end

  test 'updating a Like' do
    visit likes_url
    click_on 'Edit', match: :first

    fill_in 'Post', with: @like.post_id
    fill_in 'User', with: @like.user_id
    click_on 'Update Like'

    assert_text 'Like was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Like' do
    visit likes_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Like was successfully destroyed'
  end
end
