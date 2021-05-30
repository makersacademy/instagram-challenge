# frozen_string_literal: true

require 'rails_helper'

feature 'Removing posts' do
  let!(:user) { create(:user) }
  let!(:post) { create(:post, caption: 'Amazing sunrise! #sunrise') }

  background do
    visit '/'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'

    click_link(href: post_path(post.id))
  end

  scenario 'can remove a post' do
    click_button 'Remove'
    expect(page).to(have_content('Post deleted'))
    expect(page).to_not(have_content('Amazing sunrise! #sunrise'))
  end
end
