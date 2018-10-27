require_relative '../helpers/custom_feature_helper'

RSpec.describe 'Experience', type: :feature do
  scenario 'Comment on a post' do

    sign_up
    create_post
    create_comment
    expect(page).to have_content('Test Comment!')
    expect(page).to have_content('')
  end
end
