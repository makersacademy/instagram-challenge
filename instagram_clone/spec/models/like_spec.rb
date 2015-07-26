require 'rails_helper'

RSpec.describe Like, type: :model do
  it { is_expected.to belong_to :picture }
  it { is_expected.to belong_to :user }
end
