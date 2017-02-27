require 'rails_helper'

RSpec.describe User, type: :model do
  it do
    should have_many(:posts)
  end
  
  it do
    should have_many(:comments).
    through(:posts)
  end
end

