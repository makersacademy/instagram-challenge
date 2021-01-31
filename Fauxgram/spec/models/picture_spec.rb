require 'rails_helper'

RSpec.describe Picture, type: :model do
  it { should validate_presence_of(:img_link) }
  it { should validate_presence_of(:created_by) }
end