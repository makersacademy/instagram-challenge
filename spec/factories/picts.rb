FactoryBot.define do
  factory :pict do
    title "MyString?"
    hints "MyString"
    answer 'String'
    image { File.new('spec/docs/images/code_clue.jpg') }
    user  { build_stubbed(:user) }
  end
end
