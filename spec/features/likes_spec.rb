require 'rails_helper'

  feature "likes" do

    scenario "A user can like a picture which increases the likes count" do
      upload_image
      visit('/pictures')
      click_link('Like picture')
      visit('/pictures')

      expect(page).to have_content('1 like')
    end
  end
