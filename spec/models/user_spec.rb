require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_db_column(:username) }
  it { should have_db_column(:first_name) }
  it { should have_db_column(:last_name) }
  it { should have_db_column(:profile_pic) }

  subject { User.create(
    email: 'f@f.com',
    password: 'fffffff',
    username: 'f',
    first_name: 'F',
    last_name: 'Fson') }
  it { should validate_uniqueness_of(:username) }
end
