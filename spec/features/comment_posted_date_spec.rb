require 'rails_helper'

RSpec.feature 'Comment Date', type: :feature do

  before do
    user = FactoryBot.create(:user)
    login_as(user)
    upload_image
  end

  scenario "displays the date when the comment was posted" do
    Timecop.freeze do
      comment
      within('.comment') do
        expect(page).to have_content Time.zone.now.strftime('%d/%m/%Y %H:%M')
      end
    end
  end

end
