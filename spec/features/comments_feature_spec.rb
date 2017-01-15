require 'rails_helper'

feature 'commenting' do

  before do
    sign_up
    add_photo
    fill_in "comment_content", with: "nice"
    click_button 'submit'
  end

  scenario "allows users to leave a comment on a photo" do
    visit('/photos')
    expect(page).to have_content("nice")
  end

  scenario "allows users to delete a comment on a photo" do
    visit('/photos')
    expect(page).to have_content("nice")
    click_link 'Delete Comment'
    expect(page).not_to have_content("nice")
  end

end
