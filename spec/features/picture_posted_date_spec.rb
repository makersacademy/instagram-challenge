require 'rails_helper'

RSpec.feature 'Image Date', type: :feature do
  before do
    user = FactoryBot.create(:user)
    login_as(user)
  end

  scenario 'dsiplays the date the image was posted' do
    Timecop.freeze do
      upload_image
      expect(page).to have_content Time.zone.now.strftime('%d/%m/%Y %H:%M')
    end
  end

end
