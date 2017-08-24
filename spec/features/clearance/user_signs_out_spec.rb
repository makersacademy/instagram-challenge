require "rails_helper"

RSpec.feature "User signs out" do
  scenario "signs out" do
    sign_in
    sign_out

    expect_user_to_be_signed_out
  end
end
