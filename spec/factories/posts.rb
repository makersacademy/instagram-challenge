# frozen_string_literal: true

FactoryBot.define do
  factory :post do
    association :user
    link { '/app/assets/images/makers_logo.png' }
    caption { 'Makers Rich!' }
  end
end
