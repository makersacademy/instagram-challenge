require 'rails_helper'

RSpec.describe User, type: :model do
  it{ is_expected.to have_many(:photos).dependent(:destroy)}
  it{ is_expected.to have_many(:comments).dependent(:destroy)}
end

describe 'User' do
  let(:user) { User.create(email: 'test@test.com', password: '12345678') }
  # let(:photo) { Photo.create description: 'Test' }
  let(:user2) { User.create(email: 'test2@test.com', password: '12345678') }

  subject(:photo) { user.photos.create({description: 'Test'})}


  describe '#owns?' do
    it 'owner of the photo should be user' do
      expect(user.owns?(photo)).to eq true
    end

    it 'respond false if the owner of photo is not the user' do
      expect(user2.owns?(photo)).to eq false
    end
  end
end
