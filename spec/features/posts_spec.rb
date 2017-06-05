require_relative '../rails_helper'
require './spec/helpers/feature_helper'

feature 'Making posts' do

  scenario 'is not possible by unregistered users' do
    visit '/'
    expect(page).not_to have_link 'New Post'
  end

  scenario 'is possible by registered users' do
    sign_up
    click_link 'New Post'
    expect(current_path).to eq new_post_path
    fill_in: 'text', with: 'My favourite actor Muldoon'
    attach_file('ok', File.absolute_path('/Users/Jaiye/Desktop/Muldoon.png')
  end

end
