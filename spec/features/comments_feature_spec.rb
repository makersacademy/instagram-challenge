require 'rails_helper'

RSpec.feature '<<Comments>>' do

  include ActiveSupport::Testing::TimeHelpers
  context 'When a user is signed in' do
    before do
      sign_up_1
      add_picture
    end

    scenario 'users may comment on an image' do
      visit '/pictures'
      click_link 'Pirate Party!'
      post_comment
      expect(page).to have_content 'Arggh!'
    end

    scenario 'comments should show user name and timestamp' do
      visit '/pictures'
      travel_to(1.hour.ago) do
        click_link 'Pirate Party!'
        post_comment
      end
      visit '/pictures'
      click_link 'Pirate Party!'
      expect(page).to have_content 'Blackbeard'
      expect(page).to have_content 'Posted about 1 hour ago'
    end
  end

end
