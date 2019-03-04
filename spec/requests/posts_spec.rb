# frozen_string_literal: true

require 'rails_helper'
require 'devise'

RSpec.describe "Posts", type: :request do

  def setup
    sign_in User.find_by_id(1)
  end

  # TODO: Understand why, despite including   config.include Devise::Test::IntegrationHelpers, type: :request in
  # rails helper, cannot log in successfully?

  describe "GET /posts" do
    xit "works! (now write some real specs)" do
      setup
      get posts_path
      expect(response).to have_http_status(200)
    end
  end
end
