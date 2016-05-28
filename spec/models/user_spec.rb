require 'spec_helper'

describe User, type: :model do
  subject(:user) { User.create email: 'test@test.com', password: '123Test' }

  it { should have_many :posts }

  # it 'validates uniqueness of e-mail' do
  #   new_user = User.new email: 'test@test.com', password: '123Test'
  #   expect(new_user).to have(1).error_on(:email)
  #   expect(new_user).not_to be_valid
  # end

end
