# require 'spec_helper.rb'
require 'rails_helper.rb'


feature 'User account' do
  scenario 'user can sign up for account' do
    sign_up
    expect(page).to have_content('You have signed up successfully')
  end
end
