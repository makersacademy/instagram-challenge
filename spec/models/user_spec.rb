require 'rails_helper'

describe User, type: :model do

  it { should have_many :photos }
  it { should have_many :comments }
  it { should have_many :likes }
  it { is_expected.to have_many :liked_photos}

  it { should validate_uniqueness_of :email}

end
