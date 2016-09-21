require './spec/rails_helper'

describe User, type: :model do
  it { is_expected.to have_many :commented_photographs}
end
