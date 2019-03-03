require 'rails_helper'
require 'web_helper'

RSpec.feature "Sign up", type: :feature do
  scenario "Can sign up and be added to database" do
    sign_up
    expect(User.all.last.email).to eq('asd@dsa')
    expect(User.all.last.first_name).to eq('Test')
    expect(User.all.last.username).to eq('testboi')
  end
end
