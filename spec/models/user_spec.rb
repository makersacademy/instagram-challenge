require 'rails_helper'

RSpec.describe User, type: :model do

  it { should have_many :pictures }
  it { should have_many :comments }

  it 'is not valid without a username' do
    user = User.new(user_name: nil)
    expect(user).to have(1).error_on(:user_name)
    expect(user).not_to be_valid
  end

end
