require 'rails_helper'

describe Game do
  let(:a) {User.create(username: "A", email: "a@test.com", password: "password")}
  let(:b) {User.create(username: "B", email: "b@test.com", password: "password")}
  let(:game) {Game.create(player1_id: a.id, player2_id: b.id)}

  describe "#attributes" do
    it "has a a first player " do
      expect(game.player1_id).to eq a.id
    end

    it "has a a second player" do
      expect(game.player2_id).to eq b.id
    end

    it "doesn't have a winner on init" do
      expect(game.winner_id).to eq nil
    end

    it "has a winner if the game is over" do
      game.winner_id = a.id
      expect(game.winner_id).to eq a.id
    end
  end

  describe "#associations" do
    it "can call player1" do

      expect(game.player1.username).to eq "A"
    end

    it "can call player2" do
      expect(game.player2.username).to eq "B"
    end

    it "can call winner" do
      game.winner_id = a.id
      expect(game.winner.username).to eq "A"
    end

    it "can call shots" do
      empty_arr = []
      expect(game.shots).to eq empty_arr
    end

    it "can call ships" do
      empty_arr = []
      expect(game.ships).to eq empty_arr
    end

  end

  describe "#validations" do
    it "cannot save if invalid" do
      invalid_game = Game.new()
      expect(invalid_game.save).to be false
    end
  end

  # describe "#players_ready" do
  #   it "passes true when there are two players set to the game" do
  #     expect(game.players_ready).to be true
  #   end

  #   it "passes false when there is only 1 player in game" do
  #     game2 = Game.new(player1_id: a.id)
  #     expect(game2.players_ready).to be false
  #   end
  # end
end
