require 'rails_helper'
require 'helpers/feed_helper_spec'


feature 'clicking a like button' do

  include Devise::Test::IntegrationHelpers

  before do
    user = Gramma.create email: 'tansaku@gmail.com', password: '12345678', password_confirmation: '12345678'
    sign_in(user)
  end


  scenario 'makes a number of likes appear' do
    make_doggo
    within find_by_id('image_box_for_1') do
      expect{ click_button('Like') }.to change{Image.all[0].likes}.from([]).to(['tansaku@gmail.com'])
    end

    expect(page).to have_content('Liked by tansaku@gmail.com')

  end
end
