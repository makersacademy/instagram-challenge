# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before(:each) do
    @user = create(:user)
    @user2 = create(:user_2)
    @relationship = Relationship.new(follower_id: @user.id,
    followed_id: @user2.id)
  end

  it 'should be valid ' do
    expect(@relationship).to be_valid
  end

  it "should require a follower_id" do
    @relationship.follower_id = nil
    expect(@relationship).to_not be_valid
  end

  it "should require a followed_id" do
    @relationship.followed_id = nil
    expect(@relationship).to_not be_valid
   end 
end
