require 'rails_helper'

RSpec.describe User, type: :model do

  it { is_expected.to have_many :posts }
  it { is_expected.to have_many :comments }
  it { is_expected.to have_many :likes }
  it { should have_many(:posts).dependent(:destroy) }
  it { should have_many(:comments).dependent(:destroy) }
  it { should have_many(:likes).dependent(:destroy) }

end
