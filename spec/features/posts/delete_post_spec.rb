require 'rails_helper'
require 'feature_helper'

feature 'Deleting posts' do
  scenario 'can remove a post if owner' do
    sign_up
    create_post
    click_on 'View post'
    click_on 'Remove'
    expect(page).not_to have_content "A lovely castle"
  end

  scenario 'cannot see links to remove a post if not owner' do
    sign_up('owner@example.com')
    create_post
    sign_out
    sign_up('visitor@example.com')
    click_on 'View post'
    expect(page).not_to have_content 'Remove'
  end
end