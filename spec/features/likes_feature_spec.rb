feature 'Like Posts' do

  scenario 'A signed in user can like a post', js: true do
    sign_up(email: 'another@example.com', username: 'mannieg')
    create_a_post
    click_link 'Sign out'
    sign_up
    visit '/mannieg'
    find('div.image').click
    find('span#heart').click
    expect(page).to have_content '1 likes'
  end

end
