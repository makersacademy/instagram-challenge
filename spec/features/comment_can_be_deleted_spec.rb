require 'rails_helper'

RSpec.feature 'Delete Comment', type: :feature do
  before do
    first_user = FactoryBot.create(:user)
    login_as(first_user)
    upload_image
    comment
  end

  scenario 'user can delete their own comment' do
    within('.comment') do
      click_link 'Destroy'
    end

    expect(page).to have_content 'Comment was successfully destroyed.'
    expect(page).not_to have_content 'This is a comment on an image'
  end

  scenario "user can't delete another user's image" do
    click_link 'Back'
    click_link 'Log Out'
    second_user = FactoryBot.create(:user)
    login_as(second_user)
    expect(page).not_to have_link 'Destroy'
  end

end
