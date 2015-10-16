require 'rails_helper'

describe Picture do
  it { is_expected.to have_many :comments }
end
