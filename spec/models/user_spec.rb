# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @user = create(:user)
    @user2 = create(:user_2)
  end

 it 'should start with both users not following each other' do
   expect(@user.following?(@user2)).to be(false)
   expect(@user2.following?(@user)).to be(false)
 end

 it "should follow and unfollow a user" do
   @user.follow(@user2)
   expect(@user.following?(@user2)).to be(true)
 end

  it "should unfollow a user" do
    @user.follow(@user2)
    @user.unfollow(@user2)
    expect(@user.following?(@user2)).to be(false)
  end

end
