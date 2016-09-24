describe User, type: :model do

  it { is_expected.to have_many :posts }
  it { is_expected.to have_many :likes }
  it { is_expected.to have_many :liked_posts }
  it { is_expected.to have_many :comments }
  it { is_expected.to have_many :commented_posts }
end
