require 'rails_helper'

RSpec.feature "LoggingIns", type: :feature do

  xit "user can log in" do
    visit "/"
    fill_in "user_email", with: DEFAULT_EMAIL
  end


end
