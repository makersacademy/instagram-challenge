require 'rails_helper'

feature "Add a comment, see that comment on individual picture page" do
  scenario "on an individual picture" do
    sign_up_user
    add_picture_and_comment
    visit('/pictures/1')
    find('#d1').click_link 'Delete'
    expect(page).not_to have_content('Name of commenter')
    expect(page).not_to have_content('Commenty Text')
  end
end
