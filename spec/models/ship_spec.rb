require 'rails_helper'

RSpec.describe Ship, type: :model do

  let(:ship_one) { Ship.new(classification: "destroyer", size: 2, x_coord: 1, y_coord: 1, hit_count: 0, orientation: 1) }
  let(:ship_two) { Ship.new(classification: "carrier", size: 5, x_coord: 3, y_coord: 3, hit_count: 3, orientation: 1) }
  let(:ship_new) { Ship.new(classification: "carrier", size: 5, x_coord: 3, y_coord: 3, game_id: 1, user_id: 1) }

  describe "The ship's attributes" do
    it "has a type" do
      expect(ship_one.classification).to eq "destroyer"
      expect(ship_two.classification).to eq "carrier"
    end

    it "has a size" do
      expect(ship_one.size && ship_two.size).to be_between(2, 5)
    end

    it "has a x coordinate" do
      expect(ship_one.x_coord && ship_two.x_coord).to be_between(0, 7)
    end

    it "has a y coordinate" do
      expect(ship_one.y_coord && ship_two.y_coord).to be_between(0, 7)
    end

    it "has a hit count" do
      expect(ship_one.hit_count && ship_two.hit_count).to be_between(0, 5)
    end

    it "is initialized with a hit_count of 0" do
      expect(ship_new.hit_count).to eq 0
    end

    # IF ORIENTATION IS ADDED... 

    # it "has an orientation"
    #   expect(ship.orientation)
    # end

  end

end

