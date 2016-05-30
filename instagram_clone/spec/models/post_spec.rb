require 'spec_helper'

describe Post, type: :model do

	let(:user){ User.create(email: 'test@test.com', password: '123456') }


	it { should belong_to :user }
	it { should have_many :comments }
	it { should have_many :likes }

	it 'requires an image to save a post' do
		post = Post.create(caption: 'This is a caption')
		expect(post.errors[:image]).to include 'You have to post a picture!'
	end

	# context '#belongs_to?' do
	# 	it 'returns true if the post belongs to the specified user' do
	# 		#how do I create a post with an image!
	# 		post = Post.create(image: image_upload, user: user)
	# 		expect(post.belongs_to?(user)).to eq true
	# 	end
	# end




end