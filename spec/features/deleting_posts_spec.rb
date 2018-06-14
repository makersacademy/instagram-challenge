require 'rails_helper.rb'

feature 'Deleting posts' do
  background do
    user = create(:user, email: 'testing@yahoo.co.uk', password: 'password1', id: 20)
    post_one = create(:post, caption: "This is a sample post")

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
