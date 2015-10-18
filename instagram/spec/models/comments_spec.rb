require 'spec_helper'

describe Comment, type: :model do
  it {is_expected.to belong_to :user}
  it {is_expected.to belong_to :picture}
end
