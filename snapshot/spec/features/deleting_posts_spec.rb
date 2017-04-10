feature 'deleting posts' do
  before do
    sign_up
    visit '/posts'
    add_post
  end

  scenario 'removes a post when a user clicks a delete link' do
    visit '/posts'
    click on post
    click_link 'Delete'
    expect(page).not_to have_content ''
    expect(page).to have_content 'Restaurant deleted successfully'
  end

end
