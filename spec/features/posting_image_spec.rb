require 'rails_helper'

feature "posting images" do
  scenario "can only post when signed in" do
    visit '/'
    expect(page).to_not have_content('New Fatcat')
    sign_up('dbacall@hotmail.co.uk', 'password')
    expect(page).to have_content('New Fatcat')
  end
end