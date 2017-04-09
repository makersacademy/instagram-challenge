context 'viewing picture' do

  let!(:pic){ Picture.create(description:'Test') }

  scenario 'lets a user view a picture' do
   visit '/pictures'
   click_link 'Test'
   expect(page).to have_content 'Test'
   expect(current_path).to eq "/pictures/#{test.id}"
  end

end
