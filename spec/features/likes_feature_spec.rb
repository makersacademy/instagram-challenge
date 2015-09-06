require 'rails_helper'

feature ' likeing photos' do

  before do
    user = create(:user) do |user|
      user.photos.create(attributes_for(:photo))
    end
  end

  scenario 'a user can like a photo, which updates the like count' do
    visit photos_path
    click_link 'Like'
    expect(page).to have_content('1 like')
  end
end