feature 'authenticating users' do
  before do
    user = create(:user)
  end

  scenario 'user cant see new post if not logged in' do
    visit ('/')
    expect(page).to_not have_content 'New Post'
  end
end
