require 'rails_helper'

RSpec.describe Woof, type: :model do
  it { should belong_to(:post) }
  end
