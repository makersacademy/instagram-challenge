feature 'Editing posts' do
  before do
    post = create(:post, description: 'Testing')
  end

  scenario 'can edit a post' do
    visit ('/posts/1')
    click_link 'Edit Post'
    fill_in 'Description', with: 'Post Edited!'
    click_button 'Update Post'
    expect(page).to have_content 'Post Edited!'
  end

  scenario 'can remove a post' do
    visit ('/posts/1')
    click_link 'Edit Post'
    click_link 'Delete Post'
    expect(page).to_not have_content('Testing')
  end
end
