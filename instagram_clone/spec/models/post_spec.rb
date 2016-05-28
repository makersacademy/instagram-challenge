require 'spec_helper'

describe Post, type: :model do

	it 'requires an image to save a post' do
		post = Post.create(caption: 'This is a caption')
		expect(post.errors[:image]).to include 'You have to post a picture!'
	end

end