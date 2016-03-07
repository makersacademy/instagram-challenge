require 'rails_helper'

describe User, type: :model do
  it { is_expected.to have_many :pictures }
  it { should validate_uniqueness_of(:username) }
  it { should validate_uniqueness_of(:email) }
end
