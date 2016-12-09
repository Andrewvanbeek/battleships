class Shot < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  belongs_to :ship




  def no_same_shots
    x_coords = self.game.shots.where(user_id: self.user_id).map {|shots| shot.x_coord }
    y_coords = self.game.shots.where(user_id: self.user_id) {|shots| shot.y_coord }
    if x_coords.include?(self.x_coord) && y_coords.include?(self.y_coord)
      errors.add(:coord, "cannot be the same coords")
    end
  end

  validate :no_same_shots

end
