require 'rails_helper'

feature 'comments' do
  let!(:pfc) {Picture.create(title:'PFC',
                             image: File.new("spec/features/Pompey.jpg") )}

  scenario 'allows users to leave comments using a form' do
     visit '/pictures'
     click_link 'Comment on PFC'
     fill_in "Comment", with: "What a lovely badge"
     click_button 'Leave Comment'
     expect(current_path).to eq '/pictures'
     expect(page).to have_content('What a lovely badge')
  end

end
