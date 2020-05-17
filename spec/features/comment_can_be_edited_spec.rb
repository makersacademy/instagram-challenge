require 'rails_helper'

RSpec.feature 'Edit Comment', type: :feature do
  before do
    first_user = FactoryBot.create(:user)
    login_as(first_user)
    upload_image
    comment
  end

  scenario 'user can edit their own comment' do
    within('.comment') do
      click_link 'Edit'
    end

    fill_in 'comment_text',	with: 'This is an updated comment'
    click_button 'Update Comment'

    expect(current_path).to eq '/pictures'
    expect(page).to have_content 'Comment was successfully updated.'
    expect(page).not_to have_content 'This is a comment on an image'
    expect(page).to have_content 'This is an updated comment'
  end

  scenario "user can't edit another user's comment" do
    click_link 'Log Out'
    second_user = FactoryBot.create(:user)
    login_as(second_user)
    within('.comment') do
      expect(page).not_to have_link 'Edit'
    end
  end

end
