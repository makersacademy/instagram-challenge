describe Post, type: :model do

  describe "posts" do

    it "has correct association with user" do
      should belong_to :user
    end
  end
end
