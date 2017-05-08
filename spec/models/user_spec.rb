require 'rails_helper'

describe User, type: :model do

  it { should have_many(:photos) }
  it { should have_many(:comments) }
  it { is_expected.to have_many(:photos_commented_on) }
end
