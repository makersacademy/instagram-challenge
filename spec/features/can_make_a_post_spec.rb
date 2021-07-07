require 'rails_helper'

RSpec.feature "Makes a post", type: :feature do
  scenario "User can make a posts" do

    visit "/"
    click_link "New post"
    attach_file('Photo', File.absolute_path('./spec/features/Pineapple.png'))
    fill_in "Message", with: "Hello there!"
    click_button "Create Post"
    expect(page).to have_content("Hello there!")
    expect(page.find('img')['src']).to have_content 'Pineapple.png'
    click_on 'Back'
    click_link "New post"
    attach_file('Photo', File.absolute_path('./spec/features/Pineapple.png'))
    fill_in "Message", with: "Hi again"
    click_button "Create Post"
    click_on 'Back'
    expect(page).to have_content("Hello there!")
    expect(page).to have_content("Hi again")
    
  end
end
