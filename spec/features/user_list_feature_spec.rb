require 'rails_helper'

feature 'User list' do

  before do
    User.create(username: 'arukomp', email: 'arunas@arunas.com', password: 'password')
    User.create(username: 'arunas', email: 'arunas2@arunas.com', password: 'password')
  end

  scenario '/users shows all users' do
    visit '/users'
    expect(page).to have_css(".user-list-item", count: 2)
    expect(page).to have_content 'arukomp'
    expect(page).to have_content 'arunas'
  end

  scenario 'header has a link to view Users list' do
    visit '/'
    expect(page).to have_link 'Users'
    visit '/users/sign_in'
    expect(page).to have_link 'Users'
  end

  scenario 'Users link redirects to user list page' do
    visit '/'
    click_link 'Users'
    expect(current_path).to eq '/users'
  end

end
