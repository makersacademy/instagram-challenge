require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should validate_presence_of(:image) }
  it { should validate_presence_of(:user_id) }
  it { should validate_presence_of(:description) }
  it { should belong_to(:user) }
end