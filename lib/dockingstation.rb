require_relative 'bike'

class DockingStation
  attr_reader :bikes, :max_bikes

  def initialize
    @bikes = []
    @max_bikes = 20
  end

  def release_bike
    unless @bikes.count == 0
      @bikes.shift
    else
      raise StandardError, "No bike available"
    end
  end

  def dock(bike)
    if @bikes.count < @max_bikes
      @bikes << bike
      bike
    else
      raise StandardError, "No space available"
    end
  end
end
