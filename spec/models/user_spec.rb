require 'rails_helper'

RSpec.describe User, type: :model do

  it 'Should have a username attribute' do
    user = User.new(email: 'aaaa@aa.com', password: 'password', user_name: 'PictPict')
    expect(user).to have_attributes(:user_name => 'PictPict')
  end

end
