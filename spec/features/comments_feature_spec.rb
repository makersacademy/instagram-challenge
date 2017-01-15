require 'rails_helper'

feature 'commenting' do

  before do
    sign_up
    add_photo
    add_comment
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

  scenario "users cannot delete others' comments" do
    sign_out
    another_sign_up
    visit('/photos')
    expect(page).to have_content("nice")
    expect(page).not_to have_link('Delete Comment')

  end

end
