require 'rails_helper'

describe Picture, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to validate_presence_of :image }
  it { is_expected.to delegate_method(:username).to(:user) }
  it { is_expected.to have_many(:comments).dependent(:destroy) }
end
