describe User, type: :model do

  describe "users" do

    it "has correct association with post" do
      should have_many :posts
    end
  end
end
