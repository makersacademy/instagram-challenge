require 'spec_helper'

describe Photo, type: :model do
  it { is_expected.to belong_to :user }
  it { is_expected.to have_many :comments}
end