require 'rails_helper'

feature "delete images" do
  scenario "can delete images" do
    visit '/'
    sign_up('dbacall@hotmail.co.uk', 'password')
    post_image
    visit '/'
    click_on 'Destroy'
    expect(page).to_not have_content('my fat cat')
  end

  scenario "can only delete your own images" do
    visit '/'
    sign_up('dbacall@hotmail.co.uk', 'password')
    post_image
    visit ('/')
    expect(page).to have_content('Destroy')
    click_on 'Sign out'
    visit '/'
    expect(page).to_not have_content('Destroy')
  end
end
