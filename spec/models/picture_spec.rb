require 'rails_helper'

RSpec.describe Picture, type: :model do
  it { should have_many :comments }
end
