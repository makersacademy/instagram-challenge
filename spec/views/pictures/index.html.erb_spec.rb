require 'rails_helper'

RSpec.describe "pictures/index.html.erb", type: :view do
  pending 
  context 'when there is one saved picture' do
    it 'displays the picture' do
      Picture.create(...).save
      render
      expect(rendered).to have_css(...img src)
    end
  end
end
