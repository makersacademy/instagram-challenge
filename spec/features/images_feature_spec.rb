require 'rails_helper'

feature 'FEATURE: Images' do

  let(:image_title) { "Beast and Magneto" }
  let(:image_desc) { "Two cheeky Rabbits" }
  let(:image_file) { File.new('spec/fixture/test_rabbits.jpeg') }

  context 'no images have been added' do
    scenario 'should display a message saying no images have been added yet' do
      visit '/images'
      expect(page). to have_content 'No images have been added yet!'
    end
  end

  context 'images have been added' do
    before do
      Image.create(title: image_title, description: image_desc, image_file: image_file)
    end
    scenario 'can see images on home page' do
      visit('/')
      image_element = find('img')
      expect(image_element['src']).to include('test_rabbits')
    end
    scenario 'can see image title and description' do
      visit('/')
      expect(page).to have_content(image_title)
      expect(page).to have_content(image_desc)
    end
  end

  context 'creating images' do

    scenario 'can access a create image form from the home page' do
      visit('/')
      click_link('add_new_image')
      expect(current_path).to eq '/images/new'
    end

    scenario 'can submit a new image' do
      visit('/')
      submit_test_image
      image_element = find('img')
      expect(image_element['src']).to include('test_rabbits')
    end

  end

end
