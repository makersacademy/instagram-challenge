# frozen_string_literal: true

describe Post do
  before(:each) { @post = create(:post) }

  subject { @post }

  context 'associations' do
    it { should belong_to(:user) }
  end

  it { should respond_to(:link) }

  it '#link returns a string' do
    expect(@post.link).to match '/app/assets/images/makers_logo.png'
  end

  it { should respond_to(:caption) }

  it '#caption returns a string' do
    expect(@post.caption).to match 'Makers Rich!'
  end
end
