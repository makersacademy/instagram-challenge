require 'rails_helper.rb'

feature 'Deleting posts' do
  background do
    user = create(:user)
    post_one = create(:post, caption: "This is a sample post", user_id: user.id)

    sign_in_with user

    find(:xpath, "//a[contains(@href,'posts/1')]").click
    click_link 'Edit Post'
  end

  scenario 'can delete a post they no longer want displayed' do
    click_link 'Delete Post'
    expect(page).to have_content('Post deleted')
    expect(page).not_to have_content("This is a sample post")
  end
end
