require 'spec_helper'

feature 'Like' do

  def sign_in(user)
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  let!(:picture) { Picture.create(name: 'Love', description: 'Do you love me?') }

  before do
    user = create :user
    sign_in(user)
    visit '/'
    click_link 'Love'
    click_link 'Like'
  end


  context 'when no likes' do

    scenario 'can like a picture' do
      expect(page.current_path).to eq "/pictures/#{picture.id}"
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
