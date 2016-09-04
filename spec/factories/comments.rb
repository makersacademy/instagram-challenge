include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :comment do
    thoughts "What a cool picture!"
  end
end
