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

  describe "stats" do
    let!(:user_1) {User.create(username: "test", email: "test@gmail.com", password: "password")}
    let!(:game_1) {Game.create(player1_id: user_1.id, player2_id: 2, winner_id: user_1.id)}
    let!(:game_2) {Game.create(player1_id: user_1.id, player2_id: 2, winner_id: user_1.id)}
    let!(:game_3) {Game.create(player1_id: user_1.id, player2_id: 2, winner_id: 2)}

    it 'has a total_wins value' do
      expect(user_1.total_wins).to eq 2
    end

    it 'has a total_losses value' do
      p '-------------------'
      p user_1
      p '-------------------'
      expect(user_1.total_losses).to eq 1
    end

    # UPDATE WHEN SHOTS ARE ADDED
    xit 'has a total_shots_fired value' do
      expect(user_1.total_shots_fired).to eq XX
    end

    xit 'has a total_hits value' do
      expect(user_1.total_hits).to eq XX
    end

    xit 'has a total_misses value' do
      expect(user_1.total_misses).to eq XX
    end
  end
end
