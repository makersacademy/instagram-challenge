require "rails_helper"

RSpec.feature "Likes on hipstergrams" do
 
  before { 
    sign_in(sign_up)
    add_picture            
  }



 it 'a user can like an hipstergram, before it gets cool.', js: true do
  visit '/hipstergrams'
  click_link 'Like before it is cool'
  expect(page).to have_content("1 Like")
end


end
