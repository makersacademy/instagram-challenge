require 'spec_helper'

describe Smile, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to belong_to :photo }
end