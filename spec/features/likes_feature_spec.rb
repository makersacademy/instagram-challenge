require 'spec_helper'

feature 'liking photographs' do
  before do
    Photograph.create(caption: "Kitty!")
  end

  scenario 'a signed in user can like a photograph, which increments the counter', js: true do
    sign_up_helper("test@test.com")
    click_link "Like"
    expect(page).to have_content "1 Like"
  end
end
