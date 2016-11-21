require 'spec_helper'
require 'rails_helper'

feature 'index page' do

  scenario "finds title" do
  visit '/'
  expect(page).to have_content('Instagram')
  end

end
