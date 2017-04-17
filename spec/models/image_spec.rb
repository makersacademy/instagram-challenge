require 'spec_helper'

describe Image, type: :model do
  it { is_expected.to have_many(:comments).dependent(:destroy) }
  it { is_expected.to have_many(:likes).dependent(:destroy) }
  it { is_expected.to belong_to(:user) }
end
