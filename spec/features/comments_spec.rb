require 'rails_helper'

feature 'Leaving comments' do
  background do
    visit '/'
    sign_up(username: 'allimac',email: 'camilla@email.com', password: 'pass1234')
    upload_photo
  end

  xit 'logged in users can leave comments' do
    visit '/'
    fill_in 'Comment', with: 'Sooooooooo niiice!'
    find('Comment').native.send_keys(:return)
    expect(page).to have_content 'Sooooooooo niiice!'
  end

  xit 'logged out users need to sign in before they can leave comments' do
    visit '/'
    click_link 'allimac'
    click_link 'Log out'
    fill_in 'Comment', with: 'Sooooooooo niiice!'
    find('Comment').native.send_keys(:return)
    expect(current_path).to eq '/users/sign_in'
  end
end
