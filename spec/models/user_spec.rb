require 'rails_helper'

RSpec.describe User, type: :model do
    it "has an email" do
      user = User.create!(email: "mary@makers.com", password: "makers")
      expect(user.email).to eq("mary@makers.com")
    end
end
