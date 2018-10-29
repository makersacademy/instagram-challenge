# frozen_string_literal: true

require 'rails_helper'

FactoryBot.define do
  factory :user do
    username              { "testUser" }
    email                 { "test@yahoo.com" }
    password              { "test123" }
    password_confirmation { "test123" }
  end
end
