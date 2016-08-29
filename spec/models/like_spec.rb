require 'rails_helper'

RSpec.describe Like, type: :model do

  it { is_expected.to belong_to :photo }
  it { is_expected.to belong_to :user }
  # it { is_expected.to validate_uniqueness_of(:user).scoped_to(:photo) }

end
