require 'rails_helper'

RSpec.feature 'Comment', type: :feature do
  before do
    user = FactoryBot.create(:user)
    login_as(user)
    upload_image
  end

  scenario "user can comment on an image" do
    comment
    expect(current_path).to eq '/pictures'
    expect(page).to have_content 'This is a comment on an image'
  end
end
