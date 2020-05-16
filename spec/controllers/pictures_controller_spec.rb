require 'rails_helper'

RSpec.describe PicturesController, type: :controller do
  include ActionDispatch::TestProcess::FixtureFile

  login_user

  let(:user) { User.first }
  let(:file) { fixture_file_upload('../fixtures/cat.jpeg') }
  let(:picture_attributes) { { image: file } }

  describe 'GET /' do
    it 'responds with 200' do
      get :index
      expect(response).to have_http_status(200)
    end

    let(:times) { [] }

    before do
      (0..3).each do |n|
        Timecop.travel(Time.zone.now + n.days) do
          image = FactoryBot.create(:picture, image: file)
          times << image.created_at.to_s
        end
      end
    end

    it 'displays peeps in reverse order' do
      get :index
      expect(assigns(:pictures).map(&:created_at).map(&:to_s)).to eq(times.reverse)
    end
  end

  describe 'GET /new ' do
    it 'responds with 200' do
      get :new
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /' do
    before do
      post :create, params: { picture: picture_attributes }
    end

    it 'responds with 200' do
      expect(response).to redirect_to(pictures_path)
    end

    it 'creates a post' do
      expect(Picture.find_by(image: 'cat.jpeg')).to be
    end
  end

  describe 'DELETE /destroy' do
    let(:picture) { create(:picture, user: user) }

    it 'responds with 200' do
      delete :destroy, params: { id: picture.id }
      expect(response).to redirect_to(pictures_path)
    end
  end
end
