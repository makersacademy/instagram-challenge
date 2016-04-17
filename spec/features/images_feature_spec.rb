feature 'Images' do

  context 'visiting the main page with no images added yet' do

    before :each do
      visit '/images'
    end

    scenario 'should show there are no images' do
      expect(page).to have_content 'No Images Yet'
    end

    scenario 'should prompt to add a new image' do
      expect(page).to have_link 'Add new image'
    end

  end

end
