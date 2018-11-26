# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    message { "MyString" }
    user { nil }
  end
end
