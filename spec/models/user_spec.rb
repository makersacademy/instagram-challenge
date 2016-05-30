describe User, type: :model do

  describe "users" do

    it "has correct association with post" do
      should have_many :posts
    end

    it "has correct association with comments" do
      should have_many :comments
    end
  end
end
