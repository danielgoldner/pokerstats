class Game < ActiveRecord::Base
	belongs_to :user

	validates :buyin, :numericality => {:greater_than_or_equal_to => 0},
		:presence => true
	validates :winnings, :numericality => {:greater_than_or_equal_to => 0, 
		message: 'Winnings must be greater than or equal to zero.'},
		:presence => true

	def profit
		self.winnings - self.buyin
	end
end
