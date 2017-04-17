require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to belong_to :picture }

  it { is_expected.to belong_to :user }

  it { is_expected.to validate_presence_of :user }

  it { is_expected.to validate_presence_of :picture }

  it 'can be deleted' do
    user =    create :user
    picture = create :picture, user: user
    comment = create :comment, picture: picture, user: user
    expect{comment.destroy}.to change{Comment.count}.by(-1)
  end

end
