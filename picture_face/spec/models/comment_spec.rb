RSpec.describe Comment, type: :model do
  it { should belong_to(:post) }
  it { should belong_to(:user) }
  # it { is_expected.to have_many :commented_posts }
end