require 'spec_helper'

describe User, type: :model do

	it { should have_many :posts }
	it { should have_many :comments }
  it { should have_many :likes }
  it { should have_many :liked_posts }
  it { should have_many :follower_relationships }
  it { should have_many :followed_relationships }
  it { should have_many :following }
  it { should have_many :followers }
  it { should have_many :posts_following }

end