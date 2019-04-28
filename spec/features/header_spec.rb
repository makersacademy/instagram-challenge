# frozen_string_literal: true

describe 'Header Features' do

  feature 'Navigation bar displays' do
    scenario 'on the homepage' do
      visit "/home/index"
      expect(page).to have_css("header")
      expect(page).to have_content("Instaclone")
    end
  end

  feature 'Has sign-up link' do
    scenario 'when not signed in' do
      visit "/home/index"
      expect(page).to have_css("#sign_up_link")
    end
  end

  feature 'Has logout link' do
    scenario 'when signed in' do
      sign_up_helper
      expect(page).to have_css("#sign_out_link")
    end
  end

  feature 'Has login link' do
    scenario 'when not signed in' do
      visit "/home/index"
      expect(page).to have_css("#sign_in_link")
    end
  end

end
