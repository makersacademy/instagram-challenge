require 'test_helper'

class UsersControllerTest < ActionController::TestCase
    include Devise::Test::ControllerHelpers
    test "GET new" do
        # Mimic the router behavior of setting the Devise scope through the env.
        @request.env['devise.mapping'] = Devise.mappings[:user]
    
        # Use the sign_in helper to sign in a fixture `User` record.
        sign_in users(:alice)
    
        get :new
    
        assert_responce :success
    end
end