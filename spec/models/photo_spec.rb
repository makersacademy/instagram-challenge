require 'rails_helper'

RSpec.describe Photo, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to have_many(:comments).dependent(:destroy) }
  it { is_expected.to have_many(:photo_likes).dependent(:destroy) }
  it { is_expected.to have_many(:tagged_photos).dependent(:destroy) }
  it { is_expected.to have_many(:tags).through(:tagged_photos) }
end
