require 'rails_helper'

RSpec.describe Post, type: :model do
  before(:all) do
    @post1 = create(:post)
  end

  it "is valid with valid attributes" do
    expect(@post1).to be_valid
  end

  it "is not valid without a avatar" do
    post2 = build(:post, avatar: nil)
    expect(post2).to_not be_valid
  end

  it 'is not valid with a comment over 100 char' do
    post2 = build(:post, comment: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
    expect(post2).to_not be_valid
  end

  # it 'is not valid with a non image file upload' do
  #    post2 =build(:post, avatar: Rack::Test::UploadedFile.new(Rails.root +'spec/images/cat.doc', 'image/doc'))
  # end
end
