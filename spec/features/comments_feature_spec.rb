require 'rails_helper'

feature "Comments" do
  before do
    upload_picture
  end

  scenario "allows users to leave comments using a form" do
    visit '/pictures'
    click_link "Comment on Loch Hope"
    fill_in :comment_body, with: "Great photo huni"
    click_button "Post Comment"
    expect(current_path).to eq '/pictures'
    expect(page).to have_content "Great photo huni"
  end

end
