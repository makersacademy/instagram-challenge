require 'rails_helper'

RSpec.describe Post, type: :model do
  it { should validate_presence_of(:title) }
  it { should belong_to(:user) }
  it { should have_many(:comments) }
  it { should have_many(:woofs) }

  it "create a new post" do
    user1 = User.create! :email => "aa@bb.com", :password => 'topsecret', :password_confirmation => 'topsecret'
    post = Post.create!({:id => 1, title: 'DeeDee', desc:'Foxy Jack Russell with attitude',user_id: user1.id})
  end

  it "create a comment from a new user on a post" do
    user2 = User.create! :email => "bb@cc.com", :password => 'topsecret', :password_confirmation => 'topsecret'
    post = Post.create!({:id => 3, title: 'DeeDee', desc:'Foxy Jack Russell with attitude',user_id: user2.id })
    user3 = User.create! :email => "cc@dd.com", :password => 'topsecret', :password_confirmation => 'topsecret'
    comment = Comment.create!(thoughts:'Handsome',post_id: post.id, user_id: user3.id)
  end

  end
