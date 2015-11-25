require 'rails_helper'

describe Favourite, type: :model do
  it { is_expected.to belong_to :photo }
  it { is_expected.to belong_to :user }
end
