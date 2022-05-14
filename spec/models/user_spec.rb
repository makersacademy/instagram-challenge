require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to be }

  it 'should save a new user ' do
    expect { User.create(email: "test@example.com", password: "password").save }.to change { User.all.length }.by(1)
  end

  
end
