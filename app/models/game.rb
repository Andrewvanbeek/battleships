class Game < ActiveRecord::Base

  has_many :ships
  has_many :shots
  belongs_to :player1, class_name: 'User'
  belongs_to :player2, class_name: 'User'
  belongs_to :winner, class_name: 'User'

  validates :player1_id, presence: true

  def ready_to_join
    self.player1 && player2 == nil
  end



  def player1_ships
    self.player1.ships.where(game_id: self.id)
  end

  def player2_ships
    self.player2.ships.where(game_id: self.id)
  end

  def ready_to_start
    self.player1_ships.length == 5 && self.player2_ships.length == 5
  end

  def user_ships(user)
    self.ships.find_all {|ship| ship.user_id == user.id}
  end

  def ship_there?(user, ship)
    if user.id == self.player1.id
      user_ships = user_ships(user)
      used_ships = user_ships.map {|ship| ship.classification}
      used_ships.include?(ship.classification)
    elsif user.id == self.player2.id
      user_ships = user_ships(user)
      used_ships = user_ships.map {|ship| ship.classification}
      used_ships.include?(ship.classification)
    end
  end

end
