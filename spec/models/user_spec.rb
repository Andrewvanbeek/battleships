require 'rails_helper'

describe User do
  let(:user) {User.new(username: "test", email: "test@gmail.com", password: "password")}

  describe "attributes" do
    it "has a username" do
      expect(user.username).to eq "test"
    end

    it "has a email" do
      expect(user.email).to eq "test@gmail.com"
    end

    it "has a password" do
      expect(user.password).to eq "password"
    end
  end
end
