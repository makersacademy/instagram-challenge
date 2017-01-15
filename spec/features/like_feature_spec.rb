require 'rails_helper'

feature 'liking image' do
  before do
    flower = Image.create(title: 'Flower', image: File.new("#{Rails.root}/spec/features/files/flower.jpg"))
    flower.comments.create(comment: 'Nice Picture')
  end

  scenario 'a user can like a image, which updates the image like count', js: true do
    visit '/images'
    click_link 'Like Image' #are we liking images or the comment of the image?
    expect(page).to have_content('1 like')
  end

end
