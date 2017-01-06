require_relative 'bike'

class DockingStation
  attr_reader :bikes, :max_bikes

  def initialize
    @bikes = []
    @max_bikes = 20
  end

  def release_bike

   @bikes.shift unless empty? 


  end

  def dock(bike)
    @bikes << bike unless full?

  end

private
  def full?
    raise StandardError, "No space available" if @bikes.count == @max_bikes
  end

def empty?
    raise StandardError, "No bike available" if  @bikes.count == 0
end

end
