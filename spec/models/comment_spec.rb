require 'rails_helper'

describe Comment, type: :model do

  describe 'build_with_user' do
    let(:user)             { User.create email: 'joeblogg@gmail.com' }
    let(:picture)          { Picture.new :description => "Test",
                           :image => File.new(
                           Rails.root + 'spec/images/Test.PDF')}
    let(:comment_params)   { { text: "Test", like: true } }

    subject(:comment)      { picture.comments.build_with_user(comment_params,
                                                              user) }
    it 'builds a comment' do
      expect(comment).to be_a Comment
    end

    it 'builds a comment associated with the specified user' do
      expect(comment.user).to eq user
    end
  end

  it { is_expected.to belong_to :user}
  it { is_expected.to belong_to :picture}

end
