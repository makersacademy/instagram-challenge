require 'rails_helper'

RSpec.describe Image, type: :model do
  it { should belong_to(:user) }

  it { should have_many(:comments) }
end
