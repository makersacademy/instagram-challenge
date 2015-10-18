require 'spec_helper'

describe Photo, type: :model do
  it { is_expected.to have_many :comments }
  it { should belong_to :user }
end
