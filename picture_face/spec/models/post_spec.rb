RSpec.describe Post, type: :model do

  it { should have_many(:comments) }
  it { should belong_to(:user) }

  it 'is not valid with a title of less than three characters' do
    post = Post.new(title: "kf")
    expect(post).to have(1).error_on(:title)
    expect(post).not_to be_valid
  end

end