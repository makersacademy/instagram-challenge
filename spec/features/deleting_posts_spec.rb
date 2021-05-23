require 'rails_helper.rb'

feature 'Deleting posts' do
  background do
    post = create(:post, caption: "Amazing sunrise! #sunrise")

    visit '/'
    find(:xpath, "./html/body/div[1]/section[1]/a").click
  end

  scenario 'can delete a post' do
    click_button 'Remove'
    expect(page).to have_content "Post deleted"
    expect(page).to_not have_content("Amazing sunrise! #sunrise")
  end
end