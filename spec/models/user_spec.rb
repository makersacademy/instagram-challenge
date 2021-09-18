require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validating the user creation process' do
    let(:user) { described_class.new(name: 'Test Name', username: 'testuser1', email: 'test@test.com',
                                     password: 'foobar', password_confirmation: 'foobar')
    }    

    it 'creates a valid user object' do
      expect(user).to be_valid
      expect(user.name).to eq 'Test Name'
      expect(user.username).to eq 'testuser1'
      expect(user.email).to eq 'test@test.com'
    end

    it 'shouldnt accept a blank name' do
      user.name = '   '
      expect(user).not_to be_valid
    end

    it 'shouldnt accept a blank username' do
      user.username = '   '
      expect(user).not_to be_valid
    end

    it 'shouldnt accept a blank email' do
      user.email = '   '
      expect(user).not_to be_valid
    end

    it 'shouldnt accept a name that is too long' do 
      user.name = 'a' * 26
      expect(user).not_to be_valid
    end

    it 'shouldnt accept a username that is too long' do 
      user.username = 'a' * 16
      expect(user).not_to be_valid
    end

    it 'shouldnt accept an email that is too long' do 
      user.email = "#{'a' * 247}@test.com"
      expect(user).not_to be_valid
    end

    it 'should accept valid emails' do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org first.last@foo.jp alice+bob@baz.cn]
      # ["user@example.com", "USER@foo.COM", "A_US-ER@foo.bar.org", "first.last@foo.jp", "alice+bob@baz.cn"]

      valid_addresses.each do |valid_address|
        user.email = valid_address
        expect(user).to be_valid
      end
    end

    it 'shouldnt accept invalid emails' do
      invalid_addresses = %w[user@example,com user_at_foo.org user.name@example. foo@bar_baz.com foo@bar+baz.com]

      invalid_addresses.each do |invalid_address|
        user.email = invalid_address
        expect(user).not_to be_valid
      end
    end

    it 'should accept valid names' do
      valid_names = ["Sherlock Holmes", "Batman", "black widow", "Martin Luther King, Jr.", "Mathias d'Arras", "Hector Sausage-Hausen"]

      valid_names.each do |valid_name|
        user.name = valid_name
        expect(user).to be_valid
      end
    end

    it 'shouldnt accept invalid names' do
      invalid_names = ["Sherlock1", "Batman$", "black_widow"]

      invalid_names.each do |invalid_name|
        user.name = invalid_name
        expect(user).not_to be_valid
      end
    end

    it 'should accept valid usernames' do
      valid_usernames = ["Sherlock_Holmes", "Batman_", "blackwidow", "ok1"]

      valid_usernames.each do |valid_username|
        user.username = valid_username
        expect(user).to be_valid
      end
    end

    it 'shouldnt accept invalid usernames' do
      invalid_usernames = ["sherlock holmes", "Batman$", "black-widow", "Martin Luther King, Jr."]

      invalid_usernames.each do |invalid_username|
        user.username = invalid_username
        expect(user).not_to be_valid
      end
    end

    it 'doesnt accept duplicated usernames' do
      user.save
      username = user.username.upcase
      duplicate_user = described_class.new(name: 'Test Two', username: username, email: 'test2@test.com', password: 'foobar', password_confirmation: 'foobar')
      expect(duplicate_user).not_to be_valid
    end

    it 'doesnt accept duplicated emails' do
      user.save
      email = user.email.upcase
      duplicate_user = described_class.new(name: 'Test Two', username: 'testuser2', email: email, password: 'foobar', password_confirmation: 'foobar')
      expect(duplicate_user).not_to be_valid
    end

    it 'should have a password (nonblank)' do
      user.password = user.password_confirmation = ' ' * 6
      expect(user).not_to be_valid
    end

    it 'should only accept a password that is atleast 6 characters long' do
      user.password = user.password_confirmation = 'a' * 5
      expect(user).not_to be_valid
    end

  end
end
