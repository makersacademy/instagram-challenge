require 'rails_helper'
require 'web_helpers'

RSpec.feature "Photo link", type: :feature do
  scenario "clicking on photo will take user to edit page" do
    sign_up
    add_photo
    expect(page).to have_conten 'Posted by Deanna'
  end
end
