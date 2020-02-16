RSpec.feature 'Comment', type: :feature do
  scenario "User can comment on post" do
    sign_up
    new_post
    click_on 'Add Comment'
    fill_in 'comment[body]', with: 'First comment'
    click_on 'Create Comment'
    expect(page).to have_content('First comment')
  end
end
