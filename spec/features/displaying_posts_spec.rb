feature 'Displaying posts' do
  scenario 'index page shows list of all posts' do
    first_post = create(:post, description: 'First post')
    second_post = create(:post, description: 'Second post')
    visit('/')
    expect(page).to have_content('First post')
    expect(page).to have_content('Second post')
    expect(page).to have_css("img[src*='picture']")
  end
end
