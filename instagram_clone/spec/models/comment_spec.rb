require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to belong_to :photo }
  let!(:photo) {Photo.create(caption: 'Oi!!') }

  it 'should remove the comment when the photo is deleted' do
    c = Comment.create(thoughts: "Hi")
    photo.comments << c
    expect{photo.destroy}.to change{Comment.count}.by(-1)
  end
end
