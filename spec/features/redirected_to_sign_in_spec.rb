feature 'not seeing posts unless signed in' do
  scenario 'user redirected to sign in page when not signed in' do
    create :post, :with_image

    visit('/')
    expect(page).not_to have_content('New post')
    expect(page).not_to have_content('Llama')
    expect(page).not_to have_css('.post')
    expect(page).to have_content('Log in')
    expect(page).to have_content('Sign up')
    expect(current_path).to eq('/users/sign_in')
  end
end
