require 'dockingstation'
require 'bike'

describe DockingStation.new do
  it { is_expected.to respond_to(:release_bike) }
end

describe Bike.new do
  it { is_expected.to respond_to(:working?) }
end
