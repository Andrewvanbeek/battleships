class Shot < ActiveRecord::Base
  belongs_to :user
  belongs_to :game
  belongs_to :ship




  def no_same_shots
    #[[],[],[]]
    coords = Shot.where(game_id: self.game_id, user_id: self.user_id).map {|shot| [shot.x_coord, shot.y_coord] }
    if coords.include?([self.x_coord, self.y_coord])
      errors.add(:coord, "cannot be the same coords")
    end
  end

  validate :no_same_shots

end
