require 'rails_helper'

describe User, type: :model do


    let(:michael) { User.create(username: "michael", email: "test1@test.co.uk", password: "123456") }
    let(:archer) { User.create(username: "archer", email: "test2@test.co.uk", password: "123456") }


  it "should follow and unfollow a user" do
    expect(michael.following? archer).to be false
    michael.follow(archer)
    expect(michael.following? archer).to be true
    expect(archer.followers.include? michael).to be true
    michael.unfollow(archer)
    expect(michael.following? archer).to be false
  end

  xit "the feed should contain the correct posts" do

  end

end
