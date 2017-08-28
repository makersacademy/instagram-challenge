# frozen_string_literal: true

module PostHelpers
  def make_a_post(picture: Rails.root.join('spec/images/humming_birds.png'),
                  description: 'Humming birds taking a bath')
    visit '/posts'
    click_link 'New Post'
    attach_file 'Picture', picture
    fill_in "Description", with: description
    click_button 'Save Post'
  end
end
