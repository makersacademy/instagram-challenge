require 'rails_helper'

RSpec.describe Post, type: :model do

    let(:post1) { create(:post, id: 2) }

  it "is valid with valid attributes" do
    expect(post1).to be_valid
  end

  it "is not valid without a avatar" do
    post2 = build(:post, avatar: nil, id: 3)
    expect(post2).to_not be_valid
  end

  it 'is not valid with a comment over 100 char' do
    post2 = build(:post, comment: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', id: 4)
    expect(post2).to_not be_valid
  end

  # it 'is not valid with a non image file upload' do
  #    post2 =build(:post, avatar: 'spec/images/cat.rb')
  #    expect(post2).to_not be_valid
  # end
end
