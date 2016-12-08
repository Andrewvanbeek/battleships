class User < ActiveRecord::Base
  has_many :shots
  has_many :ships
  has_many :games

  has_secure_password

	def total_win_count
	 	user_id = self.id
	 	wins = 0
	 	self.games.each do |game|
			if user_id == game.winner_id
				wins += 1
			end
		end
		wins
	end

		# self.games.where(winner_id: self.id)

	def total_loss_count
		self.games.length - self.games.user_total_win_count
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

end
