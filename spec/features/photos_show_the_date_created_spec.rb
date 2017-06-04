require 'rails_helper'
require './app/models/photo'

feature 'photos show the date they were created' do
  before do
    Timecop.freeze(Time.local(2017,06,05,10,0,0))
  end
  scenario 'on the photo index' do
    sign_up
    upload_photo
    visit ('/')
    expect(page).to have_content("10:00 05/06/2017")
  end
end
