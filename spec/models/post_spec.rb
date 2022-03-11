require 'rails_helper'

RSpec.describe Post, type: :model do
  it { is_expected.to be }

  it { should belong_to(:user) }
  it { should validate_presence_of(:caption) }
end
