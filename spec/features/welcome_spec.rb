require 'rails_helper'

RSpec.describe "Welcome", :type => :feature do
 feature 'Welcome' do
    scenario "User visits site and welcome page is displayed" do
      visit '/'
      expect(page).to have_content('Welcome to Cheestagram')
    end
  end
end
