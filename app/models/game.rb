class Game < ActiveRecord::Base

  has_many :ships
  has_many :shots
  belongs_to :player1, class_name: 'User'
  belongs_to :player2, class_name: 'User'
  belongs_to :winner, class_name: 'User'

  validates :player1_id, presence: true

  def ready_to_join
    self.player2 == nil
  end

  def player1_ships
    self.player1.ships.where(game_id: self.id)
  end

  def player2_ships
    self.player2.ships.where(game_id: self.id)
  end

  def player1_dead_ships
    shippys = self.player1_ships.find_all {|ship| ship.dead == true}
  end

  def player1_lost
    player1_dead_ships.count >= 5
  end


  def player2_dead_ships
    shippys = self.player2_ships.find_all {|ship| ship.dead == true}
  end

  def player2_lost
    player2_dead_ships.count >= 5
  end

  def game_over
    if player1_lost
      return true
    elsif player2_lost
      return true
    end
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

  def who_fired_last
    if !self.shots.empty?
      self.shots.last.user.id
    end
  end

  def active_player
    if self.who_fired_last == self.player1_id
      self.player2.username
    elsif self.who_fired_last == nil
      self.player1.username
    else
      self.player1.username
    end
  end
end

