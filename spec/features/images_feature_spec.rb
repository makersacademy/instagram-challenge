require 'rails_helper'

feature 'FEATURE: Images' do

  let(:image_title) { "Beast and Magneto" }
  let(:image_desc) { "Two cheeky Rabbits" }
  let(:image_file_jpeg) { File.new('spec/fixture/test_rabbits.jpeg') }
  let(:image_file_jpg) { File.new('spec/fixture/test_rabbits.jpg') }
  let(:image_file_png) { File.new('spec/fixture/test_rabbits.png') }
  let(:image_file_svg) { File.new('spec/fixture/test.svg') }

  context 'no images have been added' do
    scenario 'should display a message saying no images have been added yet' do
      visit '/images'
      expect(page). to have_content 'No images have been added yet!'
    end
  end

  context 'images have been added' do
    before do
      test_user = create_test_user
      test_user.images.create(title: image_title, description: image_desc, image_file: image_file_jpeg)
    end
    scenario 'can see images on home page' do
      visit('/')
      image_element = find('img')
      expect(image_element['src']).to include('test_rabbits')
    end
    scenario 'can see image title, description and username' do
      visit('/')
      expect(page).to have_content(image_title)
      expect(page).to have_content(image_desc)
      expect(page).to have_content('PhotoN3rd')
    end
  end

  context 'creating images' do

    context 'not signed in' do
      scenario 'cannot add an image' do
        visit('/')
        expect(page).not_to have_selector('#add_new_image')
      end
    end

    context 'signed in' do
      before do
        sign_up
      end

      scenario 'can access a create image form from the home page' do
        visit('/')
        click_link('add_new_image')
        expect(current_path).to eq '/images/new'
      end


      context 'file types' do
        scenario 'can submit a new jpeg image' do
          visit('/')
          submit_test_image(image_file: image_file_jpeg)
          image_element = find('img')
          expect(image_element['src']).to include('test_rabbits.jpeg')
        end
        scenario 'can submit a new jpg image' do
          visit('/')
          submit_test_image(image_file: image_file_jpg)
          image_element = find('img')
          expect(image_element['src']).to include('test_rabbits.jpg')
        end
        scenario 'can submit a new png image' do
          visit('/')
          submit_test_image(image_file: image_file_png)
          image_element = find('img')
          expect(image_element['src']).to include('test_rabbits.png')
        end
      end

      context 'validations' do

        scenario 'Title must be at least 3 characters' do
          visit('/')
          submit_test_image(image_title: 'tt')
          expect(page).to have_content 'Title is too short (minimum is 3 characters)'
        end

        scenario 'Description must be present' do
          visit('/')
          submit_test_image(image_desc: '')
          expect(page).to have_content "Description can't be blank"
        end

        scenario 'Image file must be selected' do
          visit('/')
          click_link('add_new_image')
          fill_in :Title, with: image_title
          fill_in :Description, with: image_desc
          click_button 'Create Image'
          expect(page).to have_content "Image file can't be blank"
        end

        scenario 'Selected file must be an image' do
          visit('/')
          submit_test_image(image_file: File.new('spec/fixture/not_an_image.dat'))
          expect(page).to have_content "Image file is invalid"
        end

        scenario 'Cannot upload unsupported image type' do
          visit('/')
          submit_test_image(image_file: File.new('spec/fixture/test.svg'))
          expect(page).to have_content "Image file is invalid"
        end

      end
    end
  end
end
