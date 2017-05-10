feature 'deleting posts' do
  before do
    sign_up
    visit '/posts'
    add_post
  end

  scenario 'removes a post when a user clicks a delete link' do
    visit '/posts'
    post_link = find(:xpath, "//a[contains(@href,'/posts/1')]")
    post_link.click
    click_link 'Delete'
    expect(page).to have_content 'Post deleted successfully'
  end
end
