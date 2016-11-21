require 'spec_helper'

describe Post, type: :model do
  it { is_expected.to have_many :comments }


  it 'should destroy all comments associated with it upon deletion' do
    post = Post.create(caption: 'this is my post')
    post.comments.create(text: 'this is my comment')
    post.destroy
    expect(post.comments.all.length).to eq(0)
  end
end
