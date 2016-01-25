require 'rails_helper'

describe Comment, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :picture }
  it { is_expected.to validate_presence_of :content }
  it { is_expected.to validate_presence_of :user }
  it { is_expected.to validate_presence_of :picture }
  it { is_expected.to delegate_method(:username).to(:user) }
end
