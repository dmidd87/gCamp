describe PagesController do
  describe "" do
    it "redirects visitor to index page" do
      get :index
      expect(response).to render_template("index")
    end
    it "redirects sometimes" do
      session[:foo] = "bar"
      get :index
      expect(response).to redirect_to(signin_path)
    end
  end
end
