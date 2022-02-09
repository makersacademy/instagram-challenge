require 'rails_helper'

RSpec.feature "a user can login", type: :feature do
  scenario "a valid user", :pending do
    it "can login", :pending do
      visit root_path
    end
  end

  scenario "an invalid user cannot login" do
    visit root_path
  end
end

