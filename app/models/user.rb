class User < ActiveRecord::Base
  has_many :shots
  has_many :ships
  has_many :games, { foreign_key: :player1_id }
  has_many :wins, { foreign_key: :winner_id, class_name: "Game" }

  has_secure_password
  validates :username, :email, presence: true

	def total_wins
		Game.where(winner_id: self.id).to_a.length
	end

	def total_losses
		self.games.length - self.total_wins
	end 

	def total_shots_fired
	 	self.shots.length
	end

	def total_hits
		self.shots.where(hit: true).length
	end

	def total_misses
		self.total_shots_fired - self.total_hits
	end

	def game_shots_fired
		if self.games.last != nil
			g_id = self.games.last.id
			Game.find(g_id).shots.length
		else
			0
		end
	end

	def game_you_shots_fired
		if self.games.last != nil
			self.games.last.shots.length
		else
			0
		end
	end

	def game_opp_shots_fired
		self.game_shots_fired - self.game_you_shots_fired
	end

	def last_game_status
		if self.games.last != nil
			if self.id == self.games.last.winner_id
				"Won"
			else
				"Lost"
			end
		end
	end
end
