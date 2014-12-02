describe PagesController do
  describe "Pages" do
    it "redirects visitor to login page if they try to access projects" do
      get :projects
      expect(response).to redirect_to(signin_path)
    end
    it "redirects visitor to login page if they try to access users" do
      get :users
      expect(response).to redirect_to(signin_path)
    end
    it "redirects visitor to login page if they try to access tasks" do
      get :tasks
      expect(response).to redirect_to(signin_path)
    end
    it "redirects visitor to login page if they try to access memberships" do
      get :memberships
      expect(response).to redirect_to(signin_path)
    end
  end
end
