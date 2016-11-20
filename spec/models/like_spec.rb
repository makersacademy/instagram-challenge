require 'rails_helper'

RSpec.describe Like, type: :model do

      let(:user) { User.create(username: 'bob', email: 'bob@gmail.com', password: '12345678', password_confirmation: '12345678') }
      let(:picture) { Picture.create(user: user) }
      subject(:like) {described_class.new(user_id: user.id, picture_id: picture.id)}

    it 'should save a like linked to both the picture and the user' do
      like.save!
      expect(Like.first.user_id).to eq user.id
      expect(Like.first.picture_id).to eq picture.id
    end

end
