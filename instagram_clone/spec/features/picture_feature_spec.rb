require 'rails_helper'

feature 'Pictures:' do
  context 'no pictures have been added' do
    scenario 'should display a prompt to add a picture' do
      visit '/'
      expect(page).to have_content "You need to sign in or sign up before continuing"
    end
  end

  context 'signed in user' do
    before do
      sign_up_and_sign_in
    end
    context 'uploading pictures' do
      scenario 'prompts user to fill out a form, then displays the new picture' do
        visit '/'
        click_link 'Upload a picture'
        fill_in 'Title', with: 'Summer 68'
        fill_in 'Description', with: 'Summer 68'
        click_button 'Upload Picture'
        expect(page).to have_content 'Summer 68'
        expect(current_path).to eq '/'
      end
    end

    # context 'viewing pictures' do
    #   before do
    #     # create_picture
    #   end
    #
    #   scenario 'should display pictures' do
    #     visit '/'
    #     create_picture
    #     p Picture.all
    #     expect(page).to have_content 'Summer 96'
    #   end
    #
    #   scenario 'lets a user view a pic' do
    #    visit '/'
    #    click_link 'Summer 96'
    #    expect(page).to have_content 'Summer 96'
    #    expect(current_path).to eq "/pictures/#{pic.id}"
    #   end
    #
    #   scenario 'let a user delete a pic' do
    #    visit '/'
    #    click_link 'Delete Summer 96'
    #    expect(page).not_to have_content 'Summer 96'
    #    expect(current_path).to eq '/'
    #   end
    # end
  end
end
