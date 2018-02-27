require 'rails_helper'

RSpec.describe Comment, type: :model do

  before do
    user = User.create email: 'test123@gmail.com', password: '12345678', password_confirmation: '12345678'
    login_as user
  end

  # it "is valid with valid attributes" do
  #   comment = create(:comment)
  #   expect(comment).to be_valid
  # end

  it "is not valid without a body entry" do
    comment2 = build(:comment, body: nil, post: nil)
    expect(comment2).to_not be_valid
  end

   it { is_expected.to belong_to :user }

end
