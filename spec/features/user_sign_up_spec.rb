# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "User sign up", type: :feature do
  scenario "User can sign up" do
    user = FactoryBot.build(:user)
    sign_up(user)
    expect(current_path).to eq "/posts"
  end
end
