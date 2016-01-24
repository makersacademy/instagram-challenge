require 'rails_helper'

RSpec.describe Hipster, type: :model do
  it {should have_many(:hipstergrams)}
  it {should_not allow_value("blah").for(:email)}
  it {should validate_uniqueness_of(:hipstername)}
  it {should validate_uniqueness_of(:email)}
  it {should validate_presence_of(:password_confirmation)}
  it {should validate_confirmation_of(:password)}

end
