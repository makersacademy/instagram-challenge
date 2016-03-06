require 'rails_helper'

RSpec.describe Post, type: :model do

  it { is_expected.to have_many :comments }
  it { should have_many(:comments).dependent(:destroy) }

  it { is_expected.to have_many :likes }
  it { should have_many(:likes).dependent(:destroy) }

end
