require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = create(:user)
  end
  
  it "Has a title" do
    expect(@user.display_name).to eq "Test_User"
  end

  it "Has an email" do
    expect(@user.email).to eq "test@email.com"
  end
end
