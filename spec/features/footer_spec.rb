# frozen_string_literal: true

require "spec_helper"
require 'rails_helper'

feature 'Footer displays' do
  scenario 'on the homepage' do
    visit "/home/index"
    expect(page).to have_css("footer")
    expect(page).to have_content("ABOUT US")
    expect(page).to have_content("© 2019 INSTACLONE")
  end
end
