describe Post, type: :model do

  it { should belong_to :user }
  it { is_expected.to have_many :likes }
end
