require 'rails_helper'
require_relative '../helpers/auth_helper'
require_relative '../helpers/post_helper'

feature 'likes' do
  include Auth, Posts

    before do
      sign_up(email: "asd@asd.com", password: "asdasdasd")
      new_post(title: "test")
    end

    scenario 'A "like" button exists under each post' do
      expect(page).to have_content 'Like'
    end

    scenario 'A user can "like" a post' do
      click_link 'Like'
      expect(page).to have_content("Unlike")
      expect(page).to have_content("(1)")
    end

end
