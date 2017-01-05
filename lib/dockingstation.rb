require_relative 'bike'

class DockingStation
  attr_reader :bikes
  def initalize
    @bikes = []
  end

  def release_bike
    unless @bikes.nil?
      bike = @bikes
      @bikes = nil
      bike
    else
      raise StandardError, "No bike available"
    end
  end

  def dock(bike)
    if @bikes.nil?
      @bikes << bike
    else
      raise StandardError, "No space available"
    end
  end
end
