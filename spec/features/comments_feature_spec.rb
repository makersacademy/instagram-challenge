require 'rails_helper'

feature 'comments' do
  scenario 'you can leave comments on photos' do
    visit photos_path
    sign_up(user)
    expect(page).to
  end
end
