require 'spec_helper'

describe Image, type: :model do
  it { is_expected.to have_many :comments }
end
