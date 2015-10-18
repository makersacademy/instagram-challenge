require 'spec_helper'

describe Photo, type: :model do
  it { is_expected.to have_many :comments }
  it { is_expected.to have_many :likes }
  it { should belong_to :user }
end
