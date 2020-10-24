require 'rails_helper'

RSpec.describe User, type: :model do
  it "is valid with valid attributes" do
    user = User.new(username: 'Joe Bloggs', email: 'joeb@hotmail.com', password: 'secret')
    expect(user).to be_valid
  end
  it "is not valid without a username" do
    user = User.new(username: nil, email: 'joeb@hotmail.com', password: 'secret')
    expect(user).to_not be_valid
  end
  it "is not valid without an email" do
    user = User.new(username: 'Joe Bloggs', email: nil, password: 'secret')
    expect(user).to_not be_valid
  end
  it "is not valid without a password" do
    user = User.new(username: 'Joe Bloggs', email: 'joeb@hotmail.com', password: nil)
    expect(user).to_not be_valid
  end
end


