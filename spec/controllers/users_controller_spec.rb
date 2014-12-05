require 'rails_helper'

describe UsersController do
  describe "Users" do

    it "redirects visitor to login page if they try to access users" do
      get :index
      expect(response).to redirect_to(signin_path)
    end
  end

    it "User can't any other other users but themselves" do
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
