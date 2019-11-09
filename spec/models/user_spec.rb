require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { described_class.create(email: 'bob@bob.com', password: 'password') }
  it 'knows its email' do
    expect(subject.email).to eq 'bob@bob.com'
  end
end
