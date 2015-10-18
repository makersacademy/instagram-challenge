require 'rails_helper'

describe Picture, type: :model do
  it { is_expected.to have_many :comments }
end
