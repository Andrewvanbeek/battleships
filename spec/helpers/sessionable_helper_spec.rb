require 'rails_helper'

describe Sessionable do
  describe "logged_in?" do
    it "returns true is a user is logged in" do
      session[:user_id] = 1
      expect(logged_in?).to eq true
    end

    it "returns false if user is not logged in" do
      expect(logged_in?).to eq false
    end
  end

  describe "current_user" do
    it "returns current user if logged in" do
      @user = User.create(username: "test", email: "test@test.com", password: "password")
      session[:user_id] = @user.id
      expect(current_user).to eq @user
    end
  end
end
