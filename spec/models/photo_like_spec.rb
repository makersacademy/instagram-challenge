require 'rails_helper'

RSpec.describe PhotoLike, type: :model do
  it { is_expected.to belong_to :photo }
  it { is_expected.to belong_to :user }
end
