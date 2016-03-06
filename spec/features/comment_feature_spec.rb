require "rails_helper"

feature "leaving comments" do

  before(:each) do
    signup
    upload_image
  end

  scenario "can comment on own image" do
    find('.image-link').click
    fill_in 'comment[content]', with: 'test comment'
    click_button 'Create Comment'
    expect(page).to have_content 'test comment'
  end

end
