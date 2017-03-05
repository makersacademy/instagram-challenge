require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to(:post)}
  it { should validate_presence_of(:thoughts)}
  end

# RSpec.describe Comment, type: :model do
#   pending it "responds to create method " do
#   end
# end
