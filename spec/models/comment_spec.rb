describe Comment, type: :model do

  describe "comments" do

    it "has correct association with user and post" do
      should belong_to :user
      should belong_to :post
    end
  end
end
