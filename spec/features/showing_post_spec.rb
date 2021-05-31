# frozen_string_literal: true

require 'rails_helper'

feature 'Can view individual posts' do
  let!(:user) { create(:user) }
  let!(:post) { create(:post) }

  background do
    visit '/'
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Log in'
  end

  scenario 'can click image to be shown selected post' do
    click_link(href: post_path(post.id))
    expect(page.current_path).to(eq(post_path(post.id)))
  end
end
