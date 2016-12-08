class Game < ActiveRecord::Base

  has_many :ships
  has_many :shots
  belongs_to :player1, class_name: 'User'
  belongs_to :player2, class_name: 'User'
  belongs_to :winner, class_name: 'User'

  validates :player1_id, :player2_id, presence: true


end
