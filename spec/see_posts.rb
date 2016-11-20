scenario 'cneed to be signed in to see posts' do
    visit '/'
    expect(page).to have_content('You need to sign in or sign up before continuing.')
  end
