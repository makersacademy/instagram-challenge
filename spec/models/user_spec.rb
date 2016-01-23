require 'rails_helper'

describe User, type: :model do
  it { is_expected.to have_many :listings}

  it "is invalid when no provider name is given" do
    user = build(:invalid_user)
    expect(user).to have(1).error_on(:provider_name)
    expect(user).not_to be_valid
  end
end
