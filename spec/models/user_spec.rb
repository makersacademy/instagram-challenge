require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:images).dependent(:destroy) }

  it { should have_many(:comments) }

  it { should have_many(:commented_images) }
end
