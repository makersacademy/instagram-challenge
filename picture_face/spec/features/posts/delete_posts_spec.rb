feature 'Delete' do

  before do
    sign_user_up
    post = create(:post)
  end

  scenario 'removes a post when a user clicks a delete link' do
    visit '/posts'
    click_link "A Picture!"
    click_link "Delete Image"
    expect(current_path).to eq posts_path
    expect(page).to have_content 'Post deleted!'
  end

end