# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'model not valid if username missing' do
      user = User.new(email: "test@test.com", password: "password")
      expect(user.valid?).to be false
    end

    it 'model valid if username present' do
      user = User.new(username: "@testuser", email: "test@test.com", password: "password")
      expect(user.valid?).to be true
    end

    it 'model not valid if username not unique' do
      User.create(username: "@testuser", email: "test@test.com", password: "password")
      user = User.new(username: "@testuser", email: "anothertest@test.com", password: "password")
      expect(user.valid?).to be false
    end

    # other tests are devise default and not tested
  end
end
