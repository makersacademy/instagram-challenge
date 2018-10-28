# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { 'factory@mail.co' }
    password { 'password' }
  end
end
