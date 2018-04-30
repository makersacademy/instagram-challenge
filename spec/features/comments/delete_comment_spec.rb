require 'rails_helper'
require 'feature_helper'

feature 'Deleting comments' do
  scenario 'can remove a comment if owner' do
    sign_up
    create_post
    fill_in 'comment-body-on-post-1', with: "This is a comment on the lovely castle"
    click_button 'submit-comment-on-post-1'
    click_on "Remove comment"
    expect(page).not_to have_content "This is a comment on the lovely castle"
  end

  scenario 'cannot see links to remove a comment if not owner' do
    sign_up
    create_post
    fill_in 'comment-body-on-post-1', with: "This is a comment on the lovely castle"
    click_button 'submit-comment-on-post-1'
    sign_out
    sign_up('visitor@example.com')
    click_on 'View post'
    expect(page).not_to have_content 'Remove comment'
  end
end