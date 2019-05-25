require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {described_class.new(email:email, name:name, username:username,password:password)}
  let(:email) {'testing@demo.com'}
  let(:name) {'testname'}
  let(:username) {'testnamesongz'}
  let(:password) {'test123'}

  describe 'User' do
    it 'must have a name' do
      expect(user.email).to eq('testing@demo.com')
    end

    it 'must have a name' do
      expect(user.name).to eq('testname')
    end

    it 'must have a username' do
      expect(user.username).to eq('testnamesongz')
    end

    it 'must have a password' do
      expect(user.password).to eq('test123')
    end
  end

  describe 'UserValidation' do
    context 'when email is blank' do
      it 'returns and error' do
        user.email = ""
        expect(user.valid?).to eq(false)
      end
    end

    context 'when email is retored' do
      it 'passes' do
        user.email = "g@demo.com"
        expect(user.valid?).to eq(true)
      end
    end

    it 'returns and error if name is blank' do
      user.name = ""
      expect(user.valid?).to eq(false)
    end

    it 'returns and error if username is blank' do
      user.username = ""
      expect(user.valid?).to eq(false)
    end

    it 'returns and error if password is blank' do
      user.password = ""
      expect(user.valid?).to eq(false)
    end

    it 'returns and error if password is less than 4 chars' do
      user.password = "123"
      expect(user.valid?).to eq(false)
    end

    it 'returns and error if password is more than 8 chars' do
      user.password = "123499999999999"
      expect(user.valid?).to eq(false)
    end
  end
end
