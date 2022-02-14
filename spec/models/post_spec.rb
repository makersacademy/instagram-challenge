RSpec.describe Post, type: :model do
    describe '#like_button' do
      it 'is white when post has no likes' do
        expect(subject.like_button).to eq('🤍')
      end
  
      it 'is red when post has >= 1 likes' do
        allow(subject).to receive(:likes) { [1] }
        expect(subject.like_button).to eq('❤️')
      end
    end
  end