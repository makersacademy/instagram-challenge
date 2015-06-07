require 'rails_helper'

describe User, type: :model do
  it { is_expected.to have_many :posts }
  it { is_expected.to have_many :commented_posts }
  it { is_expected.to have_many :liked_posts }
end