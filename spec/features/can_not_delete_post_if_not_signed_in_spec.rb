# Tests that a user that is not signed in can not delete a post
RSpec.feature "Experience", type: :feature do
  scenario 'Can not delete a post or edit caption if not signed in' do
    sign_up
    create_post
    sign_out
    expect(page).not_to have_link("DELETE MOMENT")
    expect(page).not_to have_link("EDIT CAPTION")
  end
end
