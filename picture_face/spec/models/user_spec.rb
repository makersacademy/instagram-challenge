RSpec.describe User, type: :model do
  it { should have_many(:posts) }
  it { should have_many(:comments) }
  it { is_expected.to have_many :commented_posts }
end
