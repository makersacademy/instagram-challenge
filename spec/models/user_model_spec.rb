require 'spec_helper'

describe User, type: :model do
  it { is_expected.to have_many :liked_filterspams }
  it { is_expected.to have_many :filterspams }
end
