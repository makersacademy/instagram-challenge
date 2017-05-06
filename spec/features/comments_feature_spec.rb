require 'rails_helper'

feature 'commenting' do
  before do
    Travelgram.create(name: 'Bali', description: 'Breathtaking', id: 1)
  end

  scenario 'allows users to comment on an adventure using a form' do
    visit '/travelgrams'
    click_link 'Bali'
    click_link 'Comment'

    fill_in 'Thoughts', with: 'looks amazing!'

    click_button 'Done'
    expect(current_path).to eq '/travelgrams/1'
    expect(page).to have_content 'looks amazing!'
  end

end

