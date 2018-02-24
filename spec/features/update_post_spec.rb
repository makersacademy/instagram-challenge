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
end