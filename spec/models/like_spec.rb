require 'rails_helper'

describe Like do
  it { is_expected.to belong_to :picture }
  it { is_expected.to belong_to :user }
end
