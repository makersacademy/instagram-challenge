require 'rails_helper'

feature 'Comments' do

  include WebHelper

  context 'on main page' do
    before(:each) do
      @time = Timecop.freeze(Time.local(2017, 2, 25, 12, 0, 0))

      @user_one = User.create(email: "khicks@test.com",
                      password: "123456",
                      password_confirmation: "123456")

      @user_two = User.create(email: "maggie_a_hicks@test.com",
                      password: "123456",
                      password_confirmation: "123456")

      @post = Post.create(user_id: @user_one.id,
                      caption: "Beautiful photo!",
                      image: File.new(Rails.root + 'spec/assets/test_canyon.jpg'),
                      created_at: @time)
    end

    scenario 'appear with post' do
      sign_in("khicks@test.com", "123456")
      visit '/'
      page.first(".post-link").click
      add_comment("Really like this photo")
      expect(page).to have_content "Really like this photo"
    end

    scenario 'appear with user email' do
      sign_in("khicks@test.com", "123456")
      visit '/'
      page.first(".post-link").click
      add_comment("Really like this photo")
      expect(page).to have_content "khicks@test.com"
    end
  end

end
