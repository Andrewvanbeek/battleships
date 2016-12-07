require 'rails_helper'

describe UserController do
  let!(:user) {User.create!(username: "test", email: "test@test.com", password: "password")}

  describe "GET #show" do
    it "responds with status code 200" do
      get :show, {id: user.id}
      expect(response).to have_http_status 200
    end

    it "assigns the correct user as  @user"
      get :show, {id: user.id}
      expect(assigns(:user)).to eq(user)
    end

    it "renders the :show template" do
      get :show, {id: user.id}
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "responds with status code 200"
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


end
