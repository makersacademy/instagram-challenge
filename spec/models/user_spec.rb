require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to be }

  it 'has a username' do
    user = create(:user)
    expect(User.find(user.id).username).to eq user.username
  end
end
