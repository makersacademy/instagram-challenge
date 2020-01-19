require 'rails_helper'

feature "comments" do
  scenario "can comment on images" do
    visit '/'
    sign_up('dbacall@hotmail.co.uk', 'password')
    post_image
    visit '/'
    click_on 'Show'
    fill_in 'comment[message]', with: 'First comment'
    click_on 'Create Comment'
    fill_in 'comment[message]', with: 'Second comment'
    click_on 'Create Comment'
    expect(page).to have_content('First comment')
    expect(page).to have_content('Second comment')
  end
end