require 'rails_helper'

RSpec.describe "posts/index", type: :view do
  include Devise::Test::ControllerHelpers

  let(:user) {user = User.create(first_name: "John", last_name: "Snow", email: 'test@test.com', password: "password", password_confirmation: "password") }

  before(:each) do
    sign_in user
    file = fixture_file_upload(Rails.root.join('public', 'download.png'), 'image/png')

    assign(:posts, [
      Post.create!(
        :description => "Picture 1",
        :image => file,
        :user => user
      ),
      Post.create!(
        :description => "Picture 2",
        :image => file,
        :user => user
      )
    ])
  end

  it "renders a list of posts" do
    render
    assert_select "p.description", :text => "Description: Picture 1"
  end
end
