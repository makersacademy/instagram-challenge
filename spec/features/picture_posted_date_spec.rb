require 'rails_helper'

RSpec.feature 'Image Date', type: :feature do

  scenario 'dsiplays the date the image was posted' do
    user = FactoryBot.create(:user)
    login_as(user)
    upload_image
    expect(page).to have_content "#{time_ago_in_words(Picture.first.created_at)} ago"
  end

end
