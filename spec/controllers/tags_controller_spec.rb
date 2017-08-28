describe TagsController do
  describe "GET #show" do
    it "routes to a specific tag's page" do
      tag = create(:tag)
      get :show, params: { id: tag.text }
      expect(response).to have_http_status(:success)
    end
  end
end
