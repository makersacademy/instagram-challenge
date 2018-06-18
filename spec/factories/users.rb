# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username "JoeBlogs"
    email "generic@someone.com"
    password "password"
    id 1
  end
end
