describe Filterspam, type: :model do
  it { is_expected.to have_many :comments }
  it { is_expected.to have_many :likes }
  it { is_expected.to belong_to :user }
  it { should validate_presence_of :user }
end
