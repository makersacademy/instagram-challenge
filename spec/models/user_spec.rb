require 'rails_helper'

RSpec.describe User, type: :model do
  context '#login' do
    it 'returns an empty string if not logged in' do
      user = User.new
      expect(user.login).to eq ""
    end
  end
end
