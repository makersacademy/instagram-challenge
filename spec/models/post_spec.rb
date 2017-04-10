describe Post, type: :model do
  it 'is not valid without images' do
    post = Post.new(caption: 'Driving along the Amalfi coast', image: "")
    expect(post).to have(1).error_on(:image)
    expect(post).not_to be_valid
  end
end
