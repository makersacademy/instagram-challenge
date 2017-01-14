require 'rails_helper'
require 'web_helpers'

feature 'commenting' do

  before {Photograph.create description: 'description'}

  context 'user is logged in' do

    before do
      sign_up("test@gmail.com", "password")
    end

    scenario 'allows users to leave a comment using a form' do
      visit '/'
      click_link 'Leave Comment'
      fill_in "Description", with: 'amazing'
      click_button 'submit'

      expect(current_path).to eq '/photographs'
      expect(page).to have_content('amazing')
    end



  end

  context 'user is not logged in' do

    scenario 'cannot leave a comment' do
      visit '/'
      expect(page).not_to have_link 'Leave Comment'
    end

  end



end
