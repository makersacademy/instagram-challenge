require 'rails_helper'

RSpec.describe User, type: :model do
  let!(:user) { User.create(email: "test@email.com", user_name:"test", password: "testing") }

  scenario "can create a user " do
    expect(user.user_name).to eq("test")
    expect(user.email).to eq("test@email.com")
  end
end
