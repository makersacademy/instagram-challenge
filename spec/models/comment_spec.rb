require 'rails_helper'

describe Comment, type: :model do
  it { is_expected.to belong_to(:user).dependent(:destroy) }
  it { is_expected.to belong_to(:post).dependent(:destroy) }
end
