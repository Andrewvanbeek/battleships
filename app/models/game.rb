class Game < ActiveRecord::Base

  belongs_to :player1, class_name: 'User'
  belongs_to :player2, class_name: 'User'

  belongs_to :winner, class_name: 'User'
end
