require './spec/rails_helper'

RSpec.feature 'Photos', type: :feature do

  scenario 'User uploads photo and photo renders with User email address', :type => :feature do
    sign_up
    upload_photo
    expect(page).to have_content('Posted by: example@email.com')
  end

end
