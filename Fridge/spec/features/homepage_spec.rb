feature 'Homepage is working' do
  scenario '' do
    visit('/photos')
    expect(page).to have_content("Fridge - Share your food online, where people can admire it, but only you can eat it.")
  end
end
