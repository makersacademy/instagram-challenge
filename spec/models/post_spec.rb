require 'rails_helper'

RSpec.describe Post, type: :model do

  before do
    user = User.create email: 'tester@gmail.com', password: '12345678', password_confirmation: '12345678'
    login_as user
  end

    let(:post1) { create(:post) }

  it "is valid with valid attributes" do
    expect(post1).to be_valid
  end

  it "is not valid without a avatar" do
    post2 = build(:post, avatar: nil)
    expect(post2).to_not be_valid
  end

  it 'is not valid with a comment over 100 char' do
    post2 = build(:post, comment: 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa')
    expect(post2).to_not be_valid
  end

  it{is_expected.to belong_to :user}
  it{is_expected.to have_many :comments}
  it{is_expected.to respond_to :user_id}

  # it 'is not valid with a non image file upload' do
  #    post2 =build(:post, avatar: 'spec/images/cat.rb')
  #    expect(post2).to_not be_valid
  # end
end
