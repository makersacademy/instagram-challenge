require 'rails_helper'

feature 'commenting' do

  before do
    vivien = User.create(email: 'viv@viv.com', password: '123456', id: 1)
    Turtlegram.create(caption: 'Shelly', image: File.new(File.join(Rails.root,"public/uploads/turtlegram/image/1/turtle.jpg")), user: vivien, id:2)
    visit '/'
    click_link 'Sign in'
    fill_in 'Email', with: 'viv@viv.com'
    fill_in 'Password', with: '123456'
    click_button 'Log in'
  end

  scenario 'allows turtles to leave a comment using a form' do
     visit '/turtlegrams'
     click_link 'Add comment'
     fill_in "Thoughts", with: "What a lovely shell you have"
     click_button 'Leave comment'
     expect(current_path).to eq '/turtlegrams/2'
     expect(page).to have_content "What a lovely shell you have"
    end

end
