require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    user = User.new(username: 'test',
                    email: 'test@example.com',
                    encrypted_password: 'testtest')
  end

  it 'is should have unique username' do
    user = User.new(username: 'test',
                    email: 'test@example.com',
                    encrypted_password: 'testtest')
    expect(user).not_to be_valid
  end

  it 'is not valid with a username of less than 4 characters' do
    user = User.new(username: 'tes',
                    email: 'test@example.com',
                    encrypted_password: 'testtest')
    expect(user).not_to be_valid
  end
end
