RSpec.describe User, type: :model do

  it { is_expected.to have_many :posts }

  # describe '#belongs_to?' do
  #   let(:user) {User.create(email:)}
  #   it 'returns true if the posts user matches the supplied user' do
  #
  #   end
  # end

end
