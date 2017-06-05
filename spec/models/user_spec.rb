require 'rails_helper'

RSpec.describe User, type: :model do

  it 'valid user' do
    user = create(:user)
    expect(user.valid?).to be(true)
  end

  it{ should have_many(:photos) }
  it{ should have_many(:comments) }

end
