require 'rails_helper'

RSpec.feature 'Comment', type: :feature do
  before do
    user = FactoryBot.create(:user)
    login_as(user)
    upload_image
  end

  scenario "user can comment on an image" do
    expect(page).to have_content '0 Comments'
    comment
    
    within('.comment') do
      expect(page).to have_content 'This is a comment on an image'
    end

    click_link 'Back'
    expect(page).not_to have_content '0 Comments'
    expect(page).to have_content '1 Comment'
  end
end
