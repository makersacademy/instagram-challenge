feature 'creating a new post' do
  scenario 'user can visit the page' do
    visit('/posts/new')
    expect(page).to have_content('New Post')
  end
end
