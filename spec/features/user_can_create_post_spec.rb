require 'rails_helper'

RSpec.feature 'Create Post', type: :feature do
  scenario 'Signed in User can access create a post from hompage' do
    sign_in
    expect(page).to have_button 'Create Post'
    expect(page).not_to have_content 'Sign in'
  end

  scenario 'Signed in User can create a post from hompage' do
    sign_in
    fill_in 'post[description]', with: 'password'
    attach_file('post[image]', 'spec/files/dog1.jpg')
    click_on 'Create Post'
  end

  scenario 'Signed in User can create a post from hompage' do
    expect(page).not_to have_button 'Create Post'
  end
end
