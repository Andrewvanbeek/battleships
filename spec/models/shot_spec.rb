require 'rails_helper'

describe User do
   let(:user) {User.new(username: "test", email: "test@gmail.com", password: "password")}
  let(:shot) {Shot.create!(x_coord: 4, y_coord: 4, user_id: user.id)}

  describe "attributes" do
    it "shot should have a x_coord" do
      expect(user.username).to eq "test"
    end

    it "shot should have y_coord" do
      expect(user.email).to eq "test@gmail.com"
    end

    it "shot should have a user" do
      expect(user.password).to eq "password"
    end
  end
end


