feature 'Comment on posts' do

  scenario 'A signed in user can leave a comment on a post', js: true do
    sign_up(email: 'another@example.com', username: 'mannieg')
    create_a_post
    click_link 'Sign out'
    sign_up
    visit '/mannieg'
    find('div.image').click
    fill_in 'comment_message', with: 'This is a test comment!'
    find('#comment_message').native.send_keys(:return)

    expect(page).to have_content 'This is a test comment!'
  end
end
