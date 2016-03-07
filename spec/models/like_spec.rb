require 'rails_helper'

describe Like, type: :model do
  it { should belong_to(:picture) }
end
