require 'rails_helper'

RSpec.describe User, type: :model do
  
  it {is_expected.to have_many :images}

  it ' is not valid without a name and username' do
    user = User.new(email: "test@test.com", password: "Test1234")
    expect(user).to have(1).error_on(:name)
    expect(user).to have(1).error_on(:username)
    expect(user).not_to be_valid
  end
end
