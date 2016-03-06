feature 'likeing posts' do
  before do {
    Post.create(title: "Test Post")
  }
  scenario 'users can like posts' do
    visit '/'
    click_button "Like"
    expect(page).to have_content "1 like"
  end
end
