FactoryGirl.define do
  factory :comment do
    comment { Faker::Hipster.sentence }
    post
  end

  factory :comment_params, class: Comment do
    comment { Faker::Hipster.sentence }
  end
end
