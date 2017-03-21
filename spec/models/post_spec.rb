require 'rails_helper'
require 'timecop'

describe Post, type: :model do

  before(:each) do
    allow_any_instance_of(Paperclip::Attachment).to receive(:save).and_return(true)

    @time = Timecop.freeze(Time.local(2017, 2, 26, 12, 0, 0))

    @user = User.create(email: "khicks@test.com",
                    password: "123456",
                    password_confirmation: "123456")

    @post = Post.create(user_id: @user.id,
                    caption: "Beautiful photo!",
                    image: File.new(Rails.root + 'spec/assets/test_canyon.jpg'),
                    created_at: @time)
  end

  it 'should have a caption' do
    expect(@post.caption).to eq("Beautiful photo!")
  end

  it 'should have an image' do
    expect(@post.image).to be_an_instance_of(Paperclip::Attachment)
  end

  it 'should have a time stamp' do
    expect(@post.created_at).to eq(@time)
  end

  it 'should belong to a user' do
    should belong_to :user
  end

  it 'should have many likes' do
    should have_many :likes
  end

  it 'should have many comments' do
    should have_many :comments
  end
  
end
