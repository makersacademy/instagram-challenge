# require_relative '../helpers/custom_feature_helper'
#
RSpec.describe 'Experience', type: :feature do
  scenario 'Can sign in with goodle' do
    sign_in_with_google_oauth
    expect(page).to have_link("NEW MOMENT")
  end
end
