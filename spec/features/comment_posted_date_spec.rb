require 'rails_helper'

RSpec.feature 'Comment Date', type: :feature do

  before do
    user = FactoryBot.create(:user)
    login_as(user)
    upload_image
  end

  scenario "displays the date when the comment was posted" do
    Timecop.freeze do
      fill_in "comment_text",	with: 'This is a comment on an image'
      click_button 'Create Comment'
      within('.comment') do
        expect(page).to have_content Time.zone.now.strftime('%d/%m/%Y %H:%M')
      end
    end
  end

end
