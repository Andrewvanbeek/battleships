require 'rails_helper'

describe User do
  let(:user) {User.new(username: "test", email: "test@gmail.com", password: "password")}
  let(:game) {Game.new(player1_id: 1, player2_id: 2, winner_id: 1) }

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

  describe "stats" do
    it 'has a total_wins value' do
      expect(user.total_wins).to eq 5
    end

    it 'has a total_losses value' do

    end

    it 'has a total_shots_fired value' do

    end

    it 'has a total_hits value' do

    end

    it 'has a total_misses value' do

    end
  end
end
