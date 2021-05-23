require 'rails_helper.rb'

feature 'Editing posts' do
  background do
    post = create(:post)

    visit '/'
    find(:xpath, "./html/body/div[1]/div[1]/div[2]/a").click
    click_link 'Edit Post'
  end

  scenario 'can edit a post' do
    fill_in 'Caption', with: "An updated caption!"
    click_button 'Update Post'

    expect(page).to have_content "An updated caption!"
  end

  xscenario 'posting an invalid file' do
    attach_file('Image', "spec/files/sunrise.txt")
    fill_in 'Caption', with: "Amazing sunrise! #sunrise"
    click_button 'Update Post'
    expect(page).to have_content "Image has an invalid content type"
  end
end

