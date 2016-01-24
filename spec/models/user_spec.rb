require 'rails_helper'

describe User, type: :model do
  it { is_expected.to validate_presence_of :username }
  it { is_expected.to validate_uniqueness_of :username }
  it { is_expected.to have_many(:pictures).dependent(:destroy) }
  it { is_expected.to have_many(:comments).dependent(:destroy) }

  describe '::find_for_database_authentication' do
    context 'using login as authentication key' do
      let(:login) { "email@email.com" }
      let(:opts) { { login: login } }

      it "finds user by email" do
        user = create(:user, email: login)
        authenticated = described_class.find_for_database_authentication(opts)
        expect(authenticated).to eql user
      end
      it "finds user by username" do
        user = create(:user, username: login)
        authenticated = described_class.find_for_database_authentication(opts)
        expect(authenticated).to eql user
      end
    end

    context 'not using login as authentication key' do
      let(:username) { "user" }
      let(:opts) { { username: username } }

      it "finds user by username" do
        user = create(:user, username: username)
        authenticated = described_class.find_for_database_authentication(opts)
        expect(authenticated).to eql user
      end
    end
  end

  describe '#validate_username' do
    it 'should be not equal to email already in the database' do
      create(:user, email: 'email@email.com')
      user = build(:user, username: 'email@email.com')
      expect(user).to have(1).error_on(:username)
    end
  end
end
