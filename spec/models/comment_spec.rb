require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to belong_to :post }
end
