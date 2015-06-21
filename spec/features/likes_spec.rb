require 'rails_helper'

feature 'A logged in user can' do

  before do
    sign_up('test@test.com')
    add_picture
    click_link 'Sign out'
    sign_up('test1@test.com')
    click_link 'Sign out'
  end

  scenario 'can like their own picture', js: true do
    byebug
    visit '/'
    sign_in 'test@test.com'
    expect(User.count).to eq 2
    expect(Picture.count).to eq 1
    expect(current_path).to be '/'
    click_link 'Like this'
    expect(page).to have_content 'Betty 1 Like'
  end
end