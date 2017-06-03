require './spec/rails_helper'

RSpec.feature 'Sessions', type: :feature do

  scenario 'Authenticated User can change password in profile', :type => :feature do
    sign_up
    change_password
    expect(page).to have_content('Your account has been updated successfully.')
  end

end
