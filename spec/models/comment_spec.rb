require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { should belong_to(:picture) }
end
