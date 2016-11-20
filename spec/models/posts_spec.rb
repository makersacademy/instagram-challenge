# require 'spec_helper'
# require 'rails_helper'
#
# RSpec.describe Post, type: :model do
#
#
#   	subject(:post) {described_class.create(image: "/Users/elizabethwicks/Downloads/Vogue-1939-1440x900.jpg", tag: "picture")}
#
#   	it "should set the rating" do
#   		expect(post.image).to eq("/Users/elizabethwicks/Downloads/Vogue-1939-1440x900.jpg")
#   	end
#
#   	it "should set the comment" do
#   		expect(post.comment).to eq("picture")
#   	end
#
#     it "must have image and comment" do
#       post2 = Post.new(tag: "")
#       expect {post2.save}.to_not change{Review.count}
#     end
#
#   end
