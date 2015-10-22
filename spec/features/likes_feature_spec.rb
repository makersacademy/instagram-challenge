require 'spec_helper'

feature 'Like' do

  def sign_in(user)
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  before do
    user = create :user
    sign_in(user)
    click_link 'Add a picture'
    attach_file('picture[image]', File.join(Rails.root,'spec',"files", 'images', 'duck.jpg'))
    fill_in 'Name', with: 'Kiss'
    fill_in 'Description', with: 'You'
    click_button 'Create Picture'
    visit '/'
    click_link 'Kiss'
    click_link 'Like'
  end


  context 'when no likes' do

    scenario 'can like a picture' do
      expect(page).to have_content '1 like'
    end

  end

  context 'when there are likes' do

    scenario 'can delete a like' do
      click_link '1 like'
      expect(page).not_to have_content '1 like'
    end
  end


end
