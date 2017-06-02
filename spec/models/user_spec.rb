require 'spec_helper'

RSpec.describe User, type: :model do

  it 'valid user' do
    user = create(:user)
    expect(user.valid?).to be(true)
  end

end
