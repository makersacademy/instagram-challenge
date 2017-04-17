require 'spec_helper'

describe Like, type: :modal do
  it { is_expected.to belong_to :picture }

  it { is_expected.to belong_to :user }

end
