require 'spec_helper'

RSpec.describe User, type: :model do
  let(:user){ create :user }

  it 'valid user' do
    expect(user.valid?).to be(true)
  end
  
end
