require "rails_helper"

RSpec.describe "User", type: :model do
  
  describe "#handle" do

    it "uses first half of email as user's handle" do
      test_user = User.new(email: "test.email@abc.com", password: "123456")
      expect(test_user.handle).to eq("test.email")
    end
  end
end