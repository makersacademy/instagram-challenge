require './spec/rails_helper'

RSpec.feature 'Sessions', type: :feature do

  scenario 'User can sign up', :type => :feature do
    sign_up
    expect(page).to have_content('Logged in as example@email.com')
  end

end
