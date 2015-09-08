require 'spec_helper'

describe Comment, type: :model do
  it { is_expected.to belong_to(:image)}
  it { is_expected.to belong_to(:user)}
end
