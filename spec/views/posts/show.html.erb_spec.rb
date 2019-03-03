require 'rails_helper'

RSpec.describe "posts/show", type: :view do
  before(:each) do
    @post = assign(:post, Post.create!(user_id: 1, image: fixture_file_upload('spec/files/unknown.jpg')))
  end

end
