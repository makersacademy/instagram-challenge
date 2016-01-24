require 'rails_helper'

feature 'comments' do
  before do
    @picture = create(:picture)
  end

  scenario 'allows comments on a picture using a form' do
    visit picture_path(@picture)
    click_link "Comment on this picture"
    fill_in "comment_thoughts", with: "Nice!"
    click_button "Post Comment"
    expect(current_path).to eq picture_path(@picture)
    expect(page).to have_content("Nice!")
  end
end
