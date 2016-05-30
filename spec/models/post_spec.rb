describe Post, type: :model do

  describe "posts" do

    it "has correct association with user" do
      should belong_to :user
    end

    it "has correct association with comment" do
      should have_many :comments
    end
  end
end
