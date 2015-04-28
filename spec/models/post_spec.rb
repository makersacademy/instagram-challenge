require 'spec_helper'

describe Post, type: :model do

  it { is_expected.to have_many :likes }
  it { is_expected.to have_many :comments }

end
