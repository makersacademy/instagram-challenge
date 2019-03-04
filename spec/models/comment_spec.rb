require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to(:post) }
  it { should belong_to(:user) }
end
