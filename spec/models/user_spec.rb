require 'rails_helper'

RSpec.describe User, type: :model do
  describe "Associations" do
    it { User.reflect_on_association(:pictures).macro.should   eq(:has_many) }
    it { User.reflect_on_association(:comments).macro.should   eq(:has_many) }
  end
end
