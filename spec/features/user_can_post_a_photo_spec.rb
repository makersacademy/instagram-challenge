require_relative '../rails_helper'


RSpec.feature "Posting photos", type: :feature do
  xscenario 'A user can post a photo which will show on the photos page' do
    visit photos_url
    click_link('New photo')
    fill_in "link", with: "https://www.wisden.com/wp-content/uploads/2018/03/GettyImages-519804320-1-e1521465003571-980x530.jpg"
    click_link('Submit')
    expect(page.html).to have_content('<img class="post-image" src="https://www.wisden.com/wp-content/uploads/2018/03/GettyImages-519804320-1-e1521465003571-980x530.jpg">
')
  end
end
