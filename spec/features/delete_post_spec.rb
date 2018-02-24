require 'rails_helper'
require 'feature_helper'

feature 'Deleting posts' do
  scenario 'can removee a post' do
    sign_up
    create_post
    click_on 'View post'
    click_on 'Remove'
    expect(page).not_to have_content "A lovely castle"
  end
end