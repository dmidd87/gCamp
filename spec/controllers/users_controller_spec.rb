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

  it "doesn't allow a logged in user to see the users index" do
    user = create_user
    session[:user_id] = user.id
    get :index, id: user.id
    expect(response.status).to eq(404)
  end

  it "only allows the admin to see the users index" do
    admin = create_admin
    session[:user_id] = admin.id
    get :index, id: admin.id
    expect(response).to be_success
  end

describe "#edit" do

    before do
      User.delete_all
    end

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
                        email_address: "test@test.com",
                        password: "password",
                        password_confirmation: "password"}
    expect(User.count == 2)
  end
end

describe "#edit" do

  before do
    User.delete_all
  end

  it "allows user to edit their own page" do
    user = create_user
    session[:user_id] = user.id
    get :edit, id: user.id
    expect(response).to be_success
  end

  it "does not allow user to edit other users page" do
    user = create_user
    user2 = create_user2
    session[:user_id] = user.id
    get :edit, id: user2.id
    expect(response.status).to eq(404)
  end

  it "allows admin to edit user info" do
    user = create_user
    admin = create_admin
    session[:user_id] = admin.id
    get :edit, id: user.id
    expect(response).to be_success
  end
end

describe "#update" do

  before do
    User.delete_all
  end

  it "allows user to update their info" do
    user = create_user
    session[:user_id] = user.id
    patch :update, id: user.id, user: {first_name: "Test",
                                      last_name: "User",
                                      email_address: "changed@test.com",
                                      password: "password",
                                      password_confirmation: "password"}
    expect(user.reload.email_address).to eq("changed@test.com")
  end

  it "allows admin to update user info" do
    admin = create_admin
    user = create_user
    session[:user_id] = admin.id
    patch :update, id: user.id, user: {first_name: "Test",
                                      last_name: "User",
                                      email_address: "haha@haha.com",
                                      password: "password",
                                      password_confirmation: "password"}
    expect(user.reload.email_address).to eq("haha@haha.com")
  end

  it "allows user to update their info" do
    user = create_user
    user2 = create_user2
    session[:user_id] = user2.id
    patch :update, id: user.id, user: {first_name: "Test",
                                      last_name: "User",
                                      email_address: "test22@test.com",
                                      password: "password",
                                      password_confirmation: "password"}
    expect(response.status).to eq(404)
  end
end

describe "#delete" do

    before do
      User.delete_all
    end

  it "allows user to delete themself" do
    user = create_user
    session[:user_id] = user.id
    delete :destroy, id: user.id
    expect(User.count).to eq(0)
  end

  it "allows admin to delete user" do
    user = create_user
    admin = create_admin
    session[:user_id] = admin.id
    delete :destroy, id: user.id
    expect(User.count).to eq(1)
  end

    it "does not allow user to delete another" do
      user = create_user
      user2 = create_user2
      session[:user_id] = user2.id
      delete :destroy, id: user.id
      expect(User.count).to eq(2)
    end
  end
end
