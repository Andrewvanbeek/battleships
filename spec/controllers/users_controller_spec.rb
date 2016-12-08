require 'rails_helper'

describe UsersController do
  let!(:user) {User.create!(username: "test", email: "test@test.com", password: "password")}

  describe "GET #show" do
    it "responds with status code 200" do
      get :show, {id: user.id}
      expect(response).to have_http_status 200
    end

    it "assigns the correct user as @user" do
      get :show, {id: user.id}
      expect(assigns(:user)).to eq(user)
    end

    it "renders the :show template" do
      get :show, {id: user.id}
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "responds with status code 200" do
      get :new
      expect(response).to have_http_status 200
    end

    it "assigns a new game to @game" do
      get :new
      expect(assigns(:user)).to be_a_new User
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "when valid params are passed" do
      it "reponds with status code 302" do
        post :create, {user: {username: "test", email: "test@test.com", password: "password"}}
        expect(response).to have_http_status 302
      end

      it "creates a new user in the database" do
        post :create, {user: {username: "test", email: "test@test.com", password: "password"}}
        expect(User.all.count).to eq 2
      end

      it "assigns the newly created user as @user" do
        post :create, {user: {username: "test", email: "test@test.com", password: "password"}}
        expect(assigns(:user)).to eq(User.last)
      end

      it "redirects to the created user" do
        post :create, {user: {username: "test", email: "test@test.com", password: "password"}}
        expect(response).to redirect_to user_path(User.last)
      end
    end

    context "when invalid params are passed" do
      it "reponds with status code 200" do
        post :create, {user: {username: "", email: "test@test.com", password: "password"}}
        expect(response).to have_http_status 200
      end

      it "does not create a new user in the database" do
        post :create, {user: {username: "", email: "test@test.com", password: "password"}}
        expect(assigns(:user)).to_not be_valid(assigns(:user))
      end

      it "assigns the unsaved user as @user" do
        post :create, {user: {username: "", email: "test@test.com", password: "password"}}
        expect(assigns(:user).email).to eq('test@test.com')
      end

      it "renders the :new template" do
        post :create, {user: {username: "", email: "test@test.com", password: "password"}}
        expect(response).to render_template(:new)
      end
    end
  end


end
