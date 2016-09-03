require "rails_helper"

describe Like, type: :model do
  it { is_expected.to belong_to :post }
end
