require 'rails_helper'

feature "Add a comment, see that comment on individual picture page" do
  scenario "on an individual picture" do
    sign_up_user
    add_picture_and_comment
    visit('/pictures/1')
    find('#1').click_link 'Edit'
    fill_in 'comment[name]', with: "New name"
    fill_in 'comment[comment]', with: "New comment"
    click_button 'Update Comment'
    expect(page).to have_content('New name')
    expect(page).to have_content('New comment')
  end
end
