require 'dockingstation'
require 'bike'

describe DockingStation do
  before do
    @ds = DockingStation.new
  end

  describe ".release_bike" do
      it "release Bike to Person" do
        expect(@ds.release_bike.class).to eql(Bike.new.class)
      end
    end
end