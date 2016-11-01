require 'rails_helper'

describe Post, type: :model do
  it 'is not valid with a title of less than three characters' do
    post = Post.new(title: "aa")
    expect(post).to(have(1).error_on(:title))
    expect(post).not_to be_valid
  end

  it "is not valid unless it has a unique name" do
    post = Post.create(title: "A duplicate post")
    post.save(:validate => false)
    duplicate_post = Post.create(title: "A duplicate post")
    expect(duplicate_post).to have(1).error_on(:title)
  end

  it "is not valid without an image" do
    post = Post.create(title: "An imageless post")
    expect(post).to have(1).error_on(:image)
  end

  it 'can have tags' do
    tag = Tag.create(name: 'first')
    post = Post.new(title: 'test')
    post.save(:validate => false)
    post.tags << tag
    expect(post.tags).to include(tag)
  end

  describe 'comments' do
    describe 'build_with_user' do

      let(:user) { User.create email: 'test@test.com' }
      let(:post) { Post.create title: 'Test' }
      let(:comment_params) { {thoughts: 'great post'} }

      subject(:comment) { post.comments.build_with_user(comment_params, user) }

      it 'builds a comment' do
        expect(comment).to be_a Comment
      end

      it 'builds a comment associated with the specified user' do
        expect(comment.user).to eq user
      end
    end
  end

end
