require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should validate_presence_of(:image) }
  it { should validate_presence_of(:caption) }
  it { should validate_length_of(:caption).is_at_most(2200)}
end
