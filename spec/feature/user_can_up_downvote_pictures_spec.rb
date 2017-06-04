require 'rails_helper'

RSpec.feature 'Upvote', type: :feature do
  scenario 'User can like pictures' do
    create_account
    upload_photo
    click_on 'Upvote'
    expect(page).to have_content('Upvote 1')
  end

  scenario 'User can like a post only once' do
    create_account
    upload_photo
    click_on 'Upvote'
    click_on 'Upvote'
    expect(page).not_to have_content('Upvote 2')
  end
end
