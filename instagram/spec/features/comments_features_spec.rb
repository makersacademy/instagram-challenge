require 'rails_helper'

feature 'Adding comments' do
  before { Picture.create description: 'berries' }

  scenario 'only logged in users are able to leave a comment using a form' do
    sign_up
    click_link 'Comment on picture'
    fill_in "Comments", with: "Great picture!"
    click_button 'Leave Comment'
    expect(current_path).to eq '/pictures'
    expect(page).to have_content('Great picture!')
  end

  scenario 'for users not logged in, redirected to index when attempting to add comment' do
    visit '/pictures'
    click_link 'Comment on picture'
    expect(current_path).to eq ('/users/sign_in')
  end

  def sign_up
    visit '/pictures'
    click_link 'Sign up'
    fill_in 'Email', with: 'test123@gmail.com'
    fill_in 'Password', with: '123password'
    fill_in 'Password confirmation', with: '123password'
    click_button 'Sign up'
  end


end
