require 'rails_helper'

RSpec.describe Post, type: :model do

  pending it "creates a post with parameters" do
  Post.create title: 'Poppy',desc:'a 10 yr old retriever'
  expect (Post.first.title).to eq('Poppy')
  end
end
