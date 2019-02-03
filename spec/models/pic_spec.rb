require 'rails_helper'

RSpec.describe Pic, type: :model do
  pic = Pic.create(title: "Hello world", description: "Hello everyone, I hope the world is doing well.")

  it "pic is an instance of the Pic class" do
    expect(pic).to be_an_instance_of (Pic)
  end

  it "Pic is able to store a title" do
    expect(pic.title).to eq("Hello world")
  end

  it "Pic is able to store a description" do
    expect(pic.description).to eq("Hello everyone, I hope the world is doing well.")
  end

  it "Post is able to be edited" do
    pic.update(title: "Hi", description:"How are you ?")
    expect(pic.title).to eq("Hi")
    expect(pic.description).to eq("How are you ?")
  end

end
