require 'rails_helper'

feature "edit images" do
  scenario "can only edit your own images" do
    visit '/'
    sign_up('dbacall@hotmail.co.uk', 'password')
    post_image
    expect(page).to have_content('Edit')
    click_on 'Sign out'
    visit '/'
    expect(page).to_not have_content('Edit')
  end
end