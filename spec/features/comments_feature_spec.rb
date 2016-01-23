require 'rails_helper'
img = Rack::Test::UploadedFile.new('spec/files/pirates1.jpeg', 'image/jpg')

feature '<<Comments>>' do
  let!(:pic) {Picture.create title:'Pirates', image: img}
  scenario 'users may comment on an image' do
    visit '/pictures'
    click_link 'Pirates'
    click_link 'Post a comment...'
    fill_in 'Message', with: 'Arggh!'
    click_button 'Post comment'
    expect(current_path).to eq "/pictures/#{pic.id}"
    expect(page).to have_content 'Arggh!'
  end

end
