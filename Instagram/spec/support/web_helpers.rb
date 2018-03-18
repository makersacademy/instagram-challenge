module YourHelper
  def add_an_image_of_capybara
    visit '/images'
    click_button 'Add an image'
    attach_file('image[image]', Rails.root + "app/assets/images/Capybara.jpg")
    fill_in 'image[user]', with: 'Hannah', visible: false
    fill_in 'image[caption]', with: 'Grumpy Capybara'
    click_button 'Create Image'
  end

  def add_an_image_of_lemur
    visit '/images'
    click_button 'Add an image'
    attach_file('image[image]', Rails.root + "app/assets/images/Lemur.jpg")
    fill_in 'image[user]', with: 'Hannah', visible: false
    fill_in 'image[caption]', with: 'Grumpy Lemur'
    click_button 'Create Image'
  end
end


RSpec.configure do |config|
  config.include YourHelper, :type => :feature
end
