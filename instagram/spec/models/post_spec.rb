require 'rails_helper'

describe Post, type: :model do
  it 'is not valid with a caption of less than three characters' do
    post = Post.new(caption: "uf")
    expect(post).to have(1).error_on(:caption)
    expect(post).not_to be_valid
  end

  it "is not valid unless it has a unique name" do
    Post.create(caption: "Catford")
    post = Post.new(caption: "Catford")
    expect(post).to have(1).error_on(:caption)
  end
end
