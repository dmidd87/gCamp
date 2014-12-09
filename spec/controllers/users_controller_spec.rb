require 'rails_helper'

describe UsersController do
  describe "#index" do

  before do
    User.delete_all
  end

  it "redirects visitor to login page if they try to access users" do
      get :index
      expect(response).to redirect_to(signin_path)
    end
  end

  describe "#edit" do
    it "User can't edit any other other users but themselves" do
      user1 = User.create!(first_name: "David", last_name: "Example", email_address: "david@example.com", password: "password")
      user2 = User.create!(first_name: "Bob", last_name: "Hotdog", email_address: "bob@example.com", password: "password")
      session[:user_id] = user1.id
      get :edit, id: user2.id
      expect(response.status).to eq(404)
    end

    it "User can edit themselves" do
      user1 = User.create!(first_name: "David", last_name: "Example", email_address: "david@example.com", password: "password")
      user2 = User.create!(first_name: "Bob", last_name: "Hotdog", email_address: "bob@example.com", password: "password")
      session[:user_id] = user1.id
      get :edit, id: user1.id
      expect(response.status).to eq(200)
    end
  end

describe "create" do

  before do
    User.delete_all
  end

  it "allows admin to create a user" do
    admin = create_admin
    session[:user_id] = admin.id
    post :create, user: {first_name: "Test",
                        last_name: "User",
                        email: "test@test.com",
                        password: "password",
                        password_confirmation: "password"}
    expect(User.count == 2)
    end

    it "allows user to create a user" do
      user = create_user
      session[:user_id] = user.id
      post :create, user: {first_name: "Test",
                          last_name: "User",
                          email: "test22@test.com",
                          password: "password",
                          password_confirmation: "password"}
      expect(User.count == 2)
    end
  end
end
