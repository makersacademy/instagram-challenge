  scenario 'need to be signed in to create a post' do
    visit new_post_path
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
