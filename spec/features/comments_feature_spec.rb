require 'rails_helper'

feature 'adding comments' do

  let!(:sea) {Photo.create(title:'Awesome sea',
                             image: File.new("spec/features/sea.jpg") )}

  skip 'allows users to leave a comment' do
    visit '/photos'
    click_link 'Add a comment'
    fill_in 'thoughts', with: 'wow amazing!'
    click_button 'Leave comment'

    expect(current_path).to eq '/photos'
    expect(page).to have_content("wow amazing!")
  end

end