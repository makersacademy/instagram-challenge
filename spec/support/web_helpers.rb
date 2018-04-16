module YourHelper
  def add_an_image_of_giraffe
    visit '/images'
    click_button 'Add an image'
    attach_file('image[image]', Rails.root + "app/assets/images/Giraffe_CC.jpg")
    fill_in 'image[user]', with: 'Hannah', visible: false
    fill_in 'image[caption]', with: 'Giraffe'
    click_button 'Add image'
  end

  def add_an_image_of_alpaca
    visit '/images'
    click_button 'Add an image'
    attach_file('image[image]', Rails.root + "app/assets/images/Alpaca_CC.jpeg")
    fill_in 'image[user]', with: 'Hannah', visible: false
    fill_in 'image[caption]', with: 'Alpaca'
    click_button 'Add image'
  end
end


RSpec.configure do |config|
  config.include YourHelper, :type => :feature
end
