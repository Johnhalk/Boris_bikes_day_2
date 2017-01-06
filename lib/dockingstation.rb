require_relative 'bike'

class DockingStation
  attr_reader :bikes

  DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
  end

  def release_bike

   @bikes.shift unless empty?


  end

  def dock(bike)
    @bikes << bike unless full?

  end

private
  def full?
    raise StandardError, "No space available" if @bikes.count == DEFAULT_CAPACITY
  end

def empty?
    raise StandardError, "No bike available" if  @bikes.count == 0
end

end
