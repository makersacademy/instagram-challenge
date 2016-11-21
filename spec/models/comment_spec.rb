require 'rails_helper'

RSpec.describe Comment, type: :model do

    let(:user) { User.create(username: 'bob', email: 'bob@gmail.com', password: '12345678', password_confirmation: '12345678') }
    let(:picture) { Picture.create(user: user) }
    subject(:comment) {described_class.new(words: "wonderful", user_id: user.id, picture_id: picture.id)}

  it 'should save a comment linked to both the picture and the user' do
    comment.save!
    expect(Comment.first.user_id).to eq user.id
    expect(Comment.first.picture_id).to eq picture.id
    expect(Comment.first.words).to eq "wonderful"
  end

end
