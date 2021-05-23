require 'rails_helper.rb'

feature 'Deleting posts' do
  background do
    post = create(:post, caption: "Amazing sunrise! #sunrise")

    visit '/'
    find(:xpath, "./html/body/div[1]/div[1]/div[2]/a").click
    click_link 'Edit Post'
  end

  scenario 'can delete a post' do
    click_button 'Delete Post'
    expect(page).to have_content "Post deleted"
    expect(page).to_not have_content("Amazing sunrise! #sunrise")
  end
end