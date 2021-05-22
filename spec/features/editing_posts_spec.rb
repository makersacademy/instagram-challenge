require 'rails_helper.rb'

feature 'Editing posts' do
  background do
    post = create(:post)

    visit '/'
    find(:xpath, "./html/body/div[1]/div[1]/div[2]/a").click
    click_link 'Edit'
  end

  scenario 'can edit a post' do
    fill_in 'Caption', with: "An updated caption!"
    click_button 'Update'
    expact(page).to have_content "Post updated"
    expact(page).to have_content "An updated caption!"
  end
end

