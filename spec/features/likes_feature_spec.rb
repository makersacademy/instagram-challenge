feature 'Like Posts' do

  scenario 'A signed in user can like a post', js: true do
    sign_up(email: 'another@example.com', username: 'mannieg')
    create_a_post
    click_link 'Sign out'
    sign_up
    visit '/mannieg'
    within(:css, 'div.post') do
      click_link 'Heart'
    end
    expect(page).to have_content '1 like'
  end

end
