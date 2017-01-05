require_relative 'bike'

class DockingStation
  attr_reader :docked

  def release_bike
    unless @docked.nil?
      bike = @docked
      @docked = nil
      bike
    else
      raise StandardError, "No bike available"
    end
  end

  def dock(bike)
    @docked = bike
  end
end
