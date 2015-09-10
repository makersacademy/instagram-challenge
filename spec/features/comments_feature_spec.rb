require 'rails_helper'

feature 'comments' do

  before(:each) do
    user = create(:user)
    sign_in(user)
    visit current_path
    upload_photo
  end

  scenario 'photos have a comment field' do
    visit photos_path
    expect(page).to have_field 'Add a comment...'
  end
end
