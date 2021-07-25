require 'rails_helper'

RSpec.feature "Site Layouts", type: :feature do
  feature "root path" do
    scenario "works!" do
      visit root_path
      expect(page).to have_current_path('/')
    end
  end

  feature "about path" do
    scenario "works!" do
      visit about_path
      expect(page).to have_current_path('/about')
    end
  end
end
