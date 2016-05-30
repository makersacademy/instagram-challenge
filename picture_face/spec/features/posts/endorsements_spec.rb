feature 'endorsing posts' do
  before do
    sign_user_up
    post = create(:post)
  end

  scenario 'a user can endorse an image, which updates the post endorsement count' do
    visit '/'
    click_link 'Like'
    expect(page).to have_content('+1')
  end

end