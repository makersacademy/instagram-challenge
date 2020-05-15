require 'rails_helper'

RSpec.feature 'Comment', type: :feature do
  before do
    user = FactoryBot.create(:user)
    login_as(user)
    upload_image
  end

  scenario "user can comment on an image" do
    fill_in "comment_text",	with: 'This is a comment on an image'
    click_button 'Create Comment'
    expect(current_path).to eq '/pictures'
    expect(page).to have_content 'This is a comment on an image'
  end
end
