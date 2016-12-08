require 'rails_helper'

describe Shot do
   let(:game) {Game.create!(player1_id: user.id, player2_id: a.id)}
  let(:user) {User.create!(username: "test", email: "test@gmail.com", password: "password")}
  let(:a) {User.create!(username: "A", email: "a@test.com", password: "password")}
  let(:ship) { Ship.create!(classification: "carrier", size: 5, x_coord: 3, y_coord: 3, hit_count: 3, orientation: 1, game_id: game.id, user_id: user.id) }
  let(:shot) {Shot.create!(x_coord: ship.x_coord, y_coord: ship.y_coord, user_id: user.id, ship_id: ship.id, hit: true, game_id: game.id)}

  describe "attributes" do

   it "shot should have y_coord" do
      expect(shot.y_coord).to eq (3)
    end

    it "shot should have x_coord" do
      expect(shot.x_coord).to eq (3)
    end

    it "shot should have a user" do
      expect(shot.user.username).to eq "test"
    end

    it "shot should have a game" do
      expect(shot.game).to eq (game)
    end

     it "shot should have a ship" do
      expect(shot.ship).to eq (ship)
    end

     it "shot should have a hit" do
      expect(shot.hit).to eq (true)
    end
  end
end


