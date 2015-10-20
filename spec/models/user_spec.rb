require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many :images }

  it { is_expected.to have_many :comments }

  it { is_expected.to have_many :commented_images }

  it { is_expected.to have_many :likes }

  it { is_expected.to have_many :liked_images }
end
