require 'rails_helper'

describe Picture, type: :model do
  it { is_expected.to belong_to(:user) }
end
