require 'rails_helper'

feature 'Feature - likes' do
  before  do
    sign_up
    add_a_picture
    sign_out
    sign_up("seconduser", "second@somewhere.com", "123456")
  end
end
