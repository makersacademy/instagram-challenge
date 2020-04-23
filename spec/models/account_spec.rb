require 'rails_helper'

RSpec.describe Account, type: :model do
  subject { described_class.new }

  it 'is valid with valid attributes' do
    subject.email = 'test@hotmail.com'
    subject.password = '123456'
    expect(subject).to be_valid
  end

  it 'is not valid without a email or password' do
    expect(subject).to_not be_valid
  end

  it 'is not valid without valid email' do
    subject.email = 'test'
    subject.password = '123456'
    expect(subject).to_not be_valid
  end

  it 'is not valid without valid password' do
    subject.email = 'test@hotmail.com'
    subject.password = '123'
    expect(subject).to_not be_valid
  end
end
