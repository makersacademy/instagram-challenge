# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "User sign in", type: :feature do
  scenario "User can sign in with valid credentials" do
    user = FactoryBot.create(:user)
    sign_in(user)
    expect(page).to have_content "Hi, Joe!"
    expect(current_path).to eq "/posts"
  end
end
