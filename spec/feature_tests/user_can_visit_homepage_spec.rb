require 'rails_helper'
RSpec.describe "User can add post", :type => :feature do
  feature 'Can add post' do
    scenario "User navigates to page and option to add post available" do
      visit '/'
      expect(page).to have_content('Fabulous Feed')
    end
  end
end
