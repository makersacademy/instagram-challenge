require 'spec_helper'

describe Comment, type: :model do
  it { is_expected.to have_many :comments }
end