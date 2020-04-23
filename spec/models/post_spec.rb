require 'rails_helper'

RSpec.describe Post, type: :model do

  it 'is not valid without a message' do
    expect(subject).to_not be_valid
  end
  
end
