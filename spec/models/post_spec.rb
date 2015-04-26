require 'rails_helper'

describe Post, :type => :model do

  it { is_expected.to belong_to :user }
  it { is_expected.to have_many :comments }
  it { is_expected.to have_many :likes }

end