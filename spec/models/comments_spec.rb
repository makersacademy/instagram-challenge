require 'spec_helper'

describe Comment, type: :model do
  it { is_expected.to belong_to :post }
  it { is_expected.to belong_to :user }

  it 'should destroy all comments associated with it upon deletion' do
    post = Post.create(caption: 'this is my post')
    post.comments.create(text: 'this is my comment')
    post.destroy
    expect(post.comments.all.length).to eq(0)
  end
end
