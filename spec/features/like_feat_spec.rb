require 'rails_helper'

feature 'Like' do

  context 'likes on pictures' do
    scenario 'pictures can receive likes that are then displayed', js: true do
      sign_up
      share_instapic
      click_button('Log out')
      sign_up2
      click_link 'Like'
      expect(page).to have_content '1 like'
    end

    scenario 'pictures can not receive likes from its owner', js: true do
      sign_up
      share_instapic
      click_link 'Like'
      expect(page).to have_content '0 like'
    end

  end

end
