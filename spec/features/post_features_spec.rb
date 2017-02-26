require 'rails_helper'

feature 'Posts' do

  include WebHelper

  context 'on main page' do
    before(:each) do
      @time_first = Timecop.freeze(Time.local(2017, 2, 25, 12, 0, 0))
      @time_last  = Timecop.freeze(Time.local(2017, 2, 26, 12, 0, 0))

      @user = User.create(email: "kmhicks92@gmail.com",
                      password: "123456",
                      password_confirmation: "123456")

      @post_one = Post.create(user_id: @user.id,
                      caption: "Beautiful photo!",
                      image: File.new(Rails.root + 'spec/assets/test_canyon.jpg'),
                      created_at: @time_first)

      @post_two = Post.create(user_id: @user.id,
                      caption: "And another!",
                      image: File.new(Rails.root + 'spec/assets/test_canyon.jpg'),
                      created_at: @time_last)
    end

    scenario 'appear with image' do
      sign_in("kmhicks92@gmail.com", "123456")
      visit '/'
      expect(page).to have_css("img")
    end

    scenario 'appear with user email' do
      sign_in("kmhicks92@gmail.com", "123456")
      visit '/'
      expect(page).to have_content("kmhicks92@gmail.com")
    end

    scenario 'appear with timestamp' do
      sign_in("kmhicks92@gmail.com", "123456")
      visit '/'
      expect(page).to have_content("25 February, 2017")
    end

    scenario 'appear in reverse chronological order' do
      sign_in("kmhicks92@gmail.com", "123456")
      visit '/'
      expect("26 February, 2017").to appear_before("25 February, 2017")
    end
  end
end
