require 'rails_helper.rb'


feature 'Commenting on posts' do
  xscenario 'should have a new post link' do
    visit '/'
    sign_in
    post
    fill_in 'content', with: "comment"
    expect(page).to have_content "comment"

  end
end
