require 'rails_helper'

describe User, type: :model do
  it { should validate_presence_of :username }
  it { should have_many :pictures }
  it { should have_many :commented_pictures }
  it { should have_many :liked_pictures }
end
