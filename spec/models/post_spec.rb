require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should validate_presence_of(:image) }
  it { should validate_presence_of(:caption) }
end
