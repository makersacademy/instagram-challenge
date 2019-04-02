require 'rails_helper'
require_relative '../test_helper_methods.rb'

RSpec.feature "feed", type: :feature, js: true do
  scenario "User can see index page" do
    sign_up
    visit "/"
    expect(page).to have_content("Showing all Hams")
  end

  scenario "Can submit posts and view them" do
    sign_up
    visit "/hams/new"
    fill_in('ham_title', :with => 'test ham title')
    fill_in('ham_text', :with => 'test ham text')
    click_button('Save Ham')
    expect(page).to have_current_path('/hams')
    expect(page).to have_content("test ham text")
  end

  scenario "Users upload image and see on feed" do
    sign_up
    visit "/hams/new"
    fill_in('ham_title', :with => 'test ham title')
    fill_in('ham_text', :with => 'test ham text')
    attach_file("ham_image", Rails.root + "app/assets/images/zoltan-kovacs-356237-unsplash.jpg")
    click_button('Save Ham')
    expect(page).to have_xpath("//img[contains(@src,'zoltan-kovacs-356237-unsplash.jpg')]")
  end
end
