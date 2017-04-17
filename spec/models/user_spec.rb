require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_many(:photos).dependent(:destroy) }

  it { is_expected.to have_many(:comments).dependent(:destroy) }

  it { is_expected.to have_many(:likes).dependent(:destroy) }

  describe 'username' do
    context 'has to be unique' do
      it 'is valid for first user' do
        user = User.create(username: 'test', email: 'test@test.com', password: 'test1234')
        expect(user).to be_valid
      end

      it 'is not valid for the second user' do
        User.create(username: 'test', email: 'test1@test.com', password: 'test1234')
        user = User.create(username: 'test', email: 'test2@test.com', password: 'test1234')
        expect(user).not_to be_valid
      end
    end
  end
end
