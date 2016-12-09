require 'rails_helper'

describe GamesController do
  let(:a) {User.create(username: "A", email: "a@test.com", password: "password")}
  let(:b) {User.create(username: "B", email: "b@test.com", password: "password")}
  let!(:game) { Game.create!(player1_id: a.id, player2_id: b.id) }

  describe "GET #index" do
    it "responds with status code 200" do
      get :index
      expect(response).to have_http_status 200
    end

    it "renders the :index template" do
      get :index
      expect(response).to render_template(:index)
    end
  end

    describe "GET #create" do
    it "renders the :index template" do
      session[:user_id] = a.id
      post :create

      expect(response).to redirect_to :action => :show, :id => assigns(:game).id
      end
  end

  describe "GET #show" do
    it "responds with status code 200" do
      get :show, { id: game.id }
      expect(response).to have_http_status 200
    end

    it "assigns the correct game as @game" do
      get :show, { id: game.id }
      expect(assigns(:game)).to eq(game)
    end

    it "renders the :show template" do
      get :show, { id: game.id }
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
      expect(assigns(:game)).to be_a_new Game
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  # describe "POST #create" do
  #   context "when valid params are passed" do
  #     it "responds with status code 302" do
  #       session[:user_id] = a.id
  #       post :create, { game: { player1_id: a.id, player2_id: b.id } }
  #       expect(response).to have_http_status 302
  #     end

  #     it "creates a new game in the database" do
  #       session[:user_id] = a.id
  #       expect { post :create, { game: { player1_id: a.id, player2_id: b.id } } }.to change(Game, :count).by(1)
  #     end

  #     it "assigns the newly created game as @game" do
  #       session[:user_id] = a.id
  #       post :create, { game: { player1_id: a.id, player2_id: b.id } }
  #       expect(assigns(:game)).to eq(Game.all[-1])
  #     end
  #   end

  #   context "when invalid params are passed" do
  #     it "responds with status code 200" do
  #       session[:user_id] = nil
  #       post :create, { game: { player1_id: nil} }
  #       expect(response).to have_http_status 200
  #     end

  #     it "does not create a new game in the database" do
  #       session[:user_id] = nil
  #       expect { post :create, { game: { player1_id: "" } } }.to change(Game, :count).by(0)
  #     end

  #     it "renders the :new template" do
  #       session[:user_id] = a.id
  #       post :create, { game: { player1_id: "", player2_id: ""} }
  #       expect(response).to redirect_to :action => :show, :id => assigns(:game).id
  #     end
  #   end
  # end
  #   describe "POST #create" do

  # end

end



