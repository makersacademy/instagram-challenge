require 'spec_helper'

describe Comment, type: :model do
  it { should belong_to :photo }
  it { should belong_to :user }
end
