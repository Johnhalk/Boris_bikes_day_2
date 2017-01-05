require_relative 'bike'

class DockingStation
	attr_reader :docked

	def release_bike
		Bike.new
	end

	def dock(bike)
		@docked = bike
	end
end
