require 'rails_helper'

feature 'Adding photos' do

  before(:each) do
    User.delete_all
  end

  scenario 'Sees thanks when photo is added' do
    sign_up
    upload_photo
    expect(page).to have_content('Thank you testusername for adding a photo')
  end
end
