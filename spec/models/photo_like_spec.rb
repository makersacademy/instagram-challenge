require 'rails_helper'

RSpec.describe PhotoLike, type: :model do
  it { is_expected.to belong_to :photo }
  it { is_expected.to belong_to :user }

  # before { Photolike.new(user_id: 1, photo_id: 1) }
  # it { is_expected.to validate_uniqueness_of(:user_id).scoped_to(:photo_id) }
end
