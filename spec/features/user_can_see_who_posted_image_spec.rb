require 'rails_helper'

RSpec.feature 'Image Owner', type: :feature do
  before do
    user = FactoryBot.create(:user)
    login_as(user)
    click_link 'New Picture'
    attach_file 'Image', Rails.root + 'spec/fixtures/cat.jpeg'
    click_button 'Create Picture'
  end

  scenario "user can upload an image" do
    expect(page).to have_content 'Posted by: Ruby Rails'
  end

end
