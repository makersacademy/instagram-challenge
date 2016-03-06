require 'rails_helper'

describe Post, type: :model do
  it { should belong_to :user }
  it { should have_many :comments }

end
