require 'rails_helper'

describe Picture, type: :model do
  it { should belong_to :user }
  it { should have_many :comments }
  it { should have_many :likes }
end
