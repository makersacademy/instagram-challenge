FactoryGirl.define do

  factory :user do
    email 't@t.t'
    password '123456'
  end

  factory :picture do
    title 'test photo'
    description 'this is a test pic'
    
    user  
  end

end
