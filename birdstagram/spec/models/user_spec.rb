require 'rails_helper'

RSpec.describe User, type: :model do
  it 'creates a user with a username, encrypted password and email address' do
    user_instance = User.create(username: "Caesar", email: "caesar@example.com",  password: "seeds4evz")
    user_instance = User.order("id").last

    expect(user_instance.username).to eq('Caesar')
    expect(user_instance.email).to eq('caesar@example.com')
    expect(user_instance.password).not_to eq("seeds4evz")
  end
end
