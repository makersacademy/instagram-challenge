describe Post do
  let(:post){Post.new}
  describe '#tag_names=' do
    describe 'no tags' do
      it 'does nothing' do
        post.tag_names = ''
        expect(post.tags).to be_empty
      end
    end
  end
end

describe Post do
  let(:post){Post.new}
  describe '#tag_names=' do
    describe 'one tag' do
      it 'prepends a tag with #' do
        post.tag_names = 'cool'
        tag = post.tags.last
        expect(tag.name).to eq '#cool'
      end
    end
  end
end
