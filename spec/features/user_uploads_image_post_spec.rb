# frozen_string_literal: true

require 'rails_helper'

feature "User Adds Pentapost" do
  scenario "successfully" do
    login
    upload_photo
    expect(page).to have_css '.caption', text: "Love Metal!"
    expect(page).to have_css '.photo'
  end
end
