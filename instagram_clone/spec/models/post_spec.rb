
describe Post, type: :model do
  it 'is not valid with a title of less than three characters' do
    post = Post.new(title: "aa")
    expect(post).not_to be_valid
  end

  it "is not valid unless it has a unique name" do
  Post.create(title: "A duplicate post")
  post = Post.new(title: "A duplicate post")
  expect(post).to have(1).error_on(:title)
end
end
