require 'rails_helper'

RSpec.describe User, type: :model do

  it "will take in a name and email" do
    user = User.new(name: 'example', email: 'test@email.com')

    expect(user).to respond_to(:name)
    expect(user.name).to eq 'example'
    expect(user).to respond_to(:email)
    expect(user.email).to eq 'test@email.com'
  end
end
