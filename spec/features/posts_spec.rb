require_relative '../rails_helper'
require './spec/helpers/feature_helper'

feature 'Making posts' do

  scenario 'is possible by registered users' do
    sign_up
    click_link 'New Post'
    expect(current_path).to eq new_post_path
  end

  scenario 'is not possible by unregisteredusers' do
    visit '/'
    expect(page).not_to have_link 'New Post'
  end

end
