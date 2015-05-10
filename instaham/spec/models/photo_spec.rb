require 'rails_helper'

RSpec.describe Photo, type: :model do
  it { is_expected.to belong_to :user }

  it { is_expected.to have_many(:comments).dependent(:destroy) }

  it { is_expected.to validate_length_of(:message).is_at_least(3) }

  it { is_expected.to validate_presence_of :user_id }
end
