# frozen_string_literal: true

require 'rails_helper'

feature "User Likes a post" do
  scenario "successfully" do
    login
    upload_photo
    within all('.caption').last do
      click_link('Love Metal!')
    end
    click_link 'like'
    expect(page).to have_content("Pentagram Like: like 1")
  end
end
