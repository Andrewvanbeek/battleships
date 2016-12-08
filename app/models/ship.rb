class Ship < ActiveRecord::Base
	belongs_to :game
  belongs_to :user

	validates :classification, presence: true
	validates :size, presence: true, :numericality => { greater_than: 1, less_than_or_equal_to: 5}
	validates :x_coord, presence: true, :numericality => { greater_than_or_equal_to: 0, less_than_or_equal_to: 7}
	validates :y_coord, presence: true, :numericality => { greater_than_or_equal_to: 0, less_than_or_equal_to: 7}
	validates :hit_count, presence: true, :numericality => { greater_than_or_equal_to: 0, less_than_or_equal_to: 5}
end
