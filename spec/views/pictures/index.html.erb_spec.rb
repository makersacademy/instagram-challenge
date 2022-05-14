require 'rails_helper'

RSpec.describe "pictures/index.html.erb", type: :view do 
  context 'when there is one saved picture' do
    it 'displays the caption' do
      pending
      Picture.create(caption: "The Sea").save
      render
      expect(rendered).to have_content("The Sea")
    end
  end
end
