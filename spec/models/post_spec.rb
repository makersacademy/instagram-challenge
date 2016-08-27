require 'rails_helper'

describe Post, type: :model do
  it { is_expected.to have_many(:comments).dependent(:destroy) }
  it { is_expected.to validate_presence_of(:image) }
  it { is_expected.to belong_to :user }
  it { is_expected.to validate_presence_of(:user_id) }
end
