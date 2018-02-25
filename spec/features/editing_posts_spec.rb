feature 'Editing posts' do
  before do
    post = create(:post)
  end

  scenario 'can edit a post' do
    visit ('/posts/1')
    click_link 'Edit Post'
    fill_in 'Description', with: 'Post Edited!'
    click_button 'Update Post'
    expect(page).to have_content 'Post Edited!'
  end
end
