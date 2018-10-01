require 'rails_helper'

RSpec.describe Photograph, type: :model do
  before(:each) do
    @user = User.create({ first_name: 'Tess', 
                          last_name: 'Tester', 
                          email: 'tess@tester.com', 
                          password: 'secure' })
    @photo = Photograph.create(user_id: @user.id, 
                               aws_key: 'test_upload')
  end

  it 'has an id' do
    expect(@photo.id).to be
  end
  it 'has a user_id' do
    expect(@photo.user_id).to be
  end
  it 'has an aws_key' do
    expect(@photo.aws_key).to be
  end
end
