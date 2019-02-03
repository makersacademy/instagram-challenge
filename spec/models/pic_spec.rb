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

  # it 'Post is able to record the creation date' do
  #   expect(post.created_at).to eq('2019-02-03 17:30:43.781661000')
  # end

  # it 'Post is able to be edited' do
  #   post.update(message: 'how are you ?')
  #   expect(post.message).to eq('how are you ?')
  # end

end
