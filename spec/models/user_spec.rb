require 'rails_helper'
require 'spec_helper'

describe User, type: :model do
  it { is_expected.to have_many(:posts) }
  it { is_expected.to have_many(:comments) }
end
