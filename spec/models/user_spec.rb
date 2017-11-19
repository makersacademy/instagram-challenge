require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should have many posts' do
    user = User.reflect_on_association(:posts)
    expect(user.macro).to eq(:has_many)
  end
end
