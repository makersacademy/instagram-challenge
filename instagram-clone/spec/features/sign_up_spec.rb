require_relative 'web_helpers'

RSpec.describe 'signing up', type: :feature do
  scenario 'a user signs up' do
    sign_up_sam

    expect(page).to have_content "Sam's feed"
  end
end
