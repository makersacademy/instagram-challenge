feature 'adding comments' do
  scenario 'a user can add comments' do
    visit ('/photos')
    click_link("Add comment")
    expect(current_path).to eq("/")
  end
end
