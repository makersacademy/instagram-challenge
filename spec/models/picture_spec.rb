require 'rails_helper'
require 'spec_helper'

describe Picture, type: :model do
  it { should belong_to :user }
  it { is_expected.to have_many :comments }
end
