# frozen_string_literal: true

describe 'Footer features' do

  feature 'Footer displays' do
    scenario 'on the homepage' do
      visit "/home/index"
      expect(page).to have_css("footer")
      expect(page).to have_content("ABOUT US")
      expect(page).to have_content("© 2019 INSTACLONE")
    end
  end

end
