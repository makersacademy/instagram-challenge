feature 'Editing posts' do

  before do
    sign_user_up
  end

  scenario 'Can edit a post' do
    post = create(:post)
    visit '/'
    click_link 'A Picture!'
    click_link 'Edit Post'
    fill_in 'Caption', with: "Oh god, you weren't meant to see this picture!"
    click_button 'Update Post'

    expect(page).to have_content("Post updated!")
    expect(page).to have_content("Oh god, you weren't meant to see this picture!")
  end
end