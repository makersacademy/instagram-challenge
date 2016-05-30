require 'spec_helper'

describe Iron, type: :model do
  let(:user) { User.create email: 'test@test.com', password: 'Test123' }
  let(:post) { Post.create title: 'Test Post',
    :image => File.new(Rails.root + 'spec/fixtures/Iron-Man-Beta.jpg'),
    :user_id => user.id }
  subject(:iron) { Iron.create user_id: user.id, post_id: post.id }

    it { should belong_to :post }
    it { should belong_to :user }

    it "can not be created twice by the same user" do
      subject
      iron2 = Iron.new user_id: user.id, post_id: post.id
      expect(iron2).to have(1).error_on(:user)
      expect(iron2).not_to be_valid
    end

  end
