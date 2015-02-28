feature 'liking' do
  before do
    sign_up('steph@test.com', 'stephtest', 'stephtest')
    add_post('Lazy day')
    click_link 'Sign out'
  end

  it 'allows a user to like a post', js: true do
    sign_up('test@test.com', 'testtest', 'testtest')
    click_link 'Like'
    expect(page).to have_content '1 like'
  end

  it 'prevents a user liking a post unless they are signed in', js: true do
    visit '/posts'
    click_link 'Like'
    expect(page).to have_content '0 likes'
  end

end