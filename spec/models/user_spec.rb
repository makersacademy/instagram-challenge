require 'rails_helper'

describe User, type: :model do
  it { is_expected.to have_many(:posts).dependent(:destroy) }
  it { is_expected.to have_many(:comments).dependent(:destroy) }
  it { is_expected.to have_many(:likes).dependent(:destroy) }
  it { is_expected.to have_many(:liked_photos).dependent(:destroy) }
  it { is_expected.to have_many(:liked_photos).through(:likes).source(:post) }
end
