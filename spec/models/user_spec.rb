require 'spec_helper'

describe User, type: :model do
  it { is_expected.to have_many :photos }
  it { is_expected.to have_many :commented_photos }
end