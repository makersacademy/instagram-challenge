require 'rails_helper'

feature "Add a comment, see that comment on individual picture page" do
  scenario "on an individual picture" do
    sign_up_user
    add_picture_and_comment
    visit('/pictures/1')
    expect(page).to have_content('Name of commenter')
    expect(page).to have_content('Commenty Text')
  end
end


feature "Add a comment, see that comment on overall picture page" do
  scenario "visit homepage with all pictures" do
    sign_up_user
    add_picture_and_comment
    visit('/pictures')
    expect(page).to have_content('Name of commenter')
    expect(page).to have_content('Commenty Text')
  end
end
