# Test that a user that is not signed in can not create a new post
RSpec.feature "Experience", type: :feature do
  scenario 'Can not post if not signed in' do
    visit '/'
    expect(page).not_to have_link("NEW MOMENT")
  end
end
