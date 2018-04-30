require 'rails_helper'
require 'feature_helper'

feature 'Editing posts' do
  scenario 'can update a post' do
    sign_up
    create_post
    click_on 'View post'
    click_on 'Edit'
    fill_in 'post-desc', with: "Totally different description"
    click_button 'Update Post'
    expect(page).to have_content "Totally different description"
  end

  scenario 'cannot see links to edit a post if not owner' do
    sign_up('owner@example.com')
    create_post
    sign_out
    sign_up('visitor@example.com')
    click_on 'View post'
    expect(page).not_to have_content 'Edit'
  end
end