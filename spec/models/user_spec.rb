require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:photos).dependent(:destroy) }

  it { is_expected.to have_many(:comments).dependent(:destroy) }

  it { is_expected.to have_many(:likes).dependent(:destroy) }
end
