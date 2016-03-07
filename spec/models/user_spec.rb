require 'rails_helper'

describe User, type: :model do
  it { is_expected.to have_many(:pictures).dependent(:destroy) }
  it { is_expected.to have_many(:comments).dependent(:destroy) }

end
