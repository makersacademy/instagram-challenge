require 'rails_helper'
require 'feature_helper'

feature 'Updating comments' do
  scenario 'can update a comment if owner' do
    sign_up
    create_post
    fill_in 'comment-body-on-post-1', with: "This is a comment on the lovely castle"
    click_button 'submit-comment-on-post-1'
    click_on "edit-comment-1"
    fill_in 'comment-body', with: "It looks delightful"
    click_button 'Update comment'
    expect(page).to have_content "It looks delightful"
  end

  scenario 'cannot see links to update a comment if not owner' do
    sign_up
    create_post
    fill_in 'comment-body-on-post-1', with: "This is a comment on the lovely castle"
    click_button 'submit-comment-on-post-1'
    sign_out
    sign_up('visitor@example.com')
    click_on 'View post'
    within('ul#comments-list') do
      expect(page).not_to have_content 'Edit'
    end
  end
end
